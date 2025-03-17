# Writing function seeding_error()
# input arguements: seeding_start, seeding_end, seed_date
# seeding_start and seeding_end are in date format "yyyy-mm-dd".
# computing set of Errors:
# for daily cases      : R2, RMSE, NSE, and KGE12

function seeding_error(seeding_start::Date, seeding_end::Date)
    # Ensure seeding_start is before or equal to seeding_end
    if seeding_start > seeding_end
        throw(ArgumentError("seeding_start should be less than or equal to seeding_end"))
    end

    # Initialize an empty vector to store the rmse
    # daily
    date_rmse  = []
    date_NSE   = []
    date_kge   = []

    # computing R2
    date_R2   = []

    # Loop from seeding_start to seeding_end inclusive
    for date in seeding_start:seeding_end
        # simulate model
        # Define start date as a string
        start_date_str = "18.11.2021"
        seed_date_str = string(Dates.format(Date(date), "dd.mm.yyyy"))
        sol1 = dengue(43.82, 13.026, start_date_str, "18.11.2024", seed_date_str)
        
        # Get daily cases
        # crop simulation output to comparable range
        sol1_crop = to(from(sol1, Date(2024, 8, 10)), Date(2024, 9, 24))
        # get the weekly case numbers
        daily_case = diff(sol1_crop["i_inst"] .+ sol1_crop["Hr"])
        
        # read Fano data
        fano_df = CSV.read("fano_data.csv", DataFrame)
        fano_df.date = DateTime.(fano_df.date, "dd/mm/yyyy")
        fano_data = (datetime = Date.(fano_df.date),
                     daily    = fano_df.daily_cases,
                     cases    = fano_df.cum_cases)
        fano_ts = TimeArray(fano_data; timestamp = :datetime)

        # crop data to coamparable range
        fano_ts_crop = to(from(fano_ts, Date(2024, 08, 15)), Date(2024, 09, 16))
        fano_sim     = to(from(daily_case, Date(2024, 08, 15)), Date(2024, 09, 16))

        # data
        dx = values(fano_ts_crop["daily"])
        dy = values(fano_sim["i_inst_Hr"])

        # compute NSE
        derror = dx .- dy
        dvar   = dx .- mean(dx)

        NSE    = 1 - (sum(derror.^2)/ sum(dvar.^2))
        
        # compute KGE12
        
        # (Pearson) correlation coefficient
        r = cor(dx, dy)                                # pearson correlation coefficient
        beta =  mean(dy)/mean(dx)                      # Bias  
        gamma = (std(dy)/mean(dy))/(std(dx)/mean(dx))  # variability

        KGE12 = 1 - sqrt((r-1)^2 + (beta-1)^2 + (gamma-1)^2)
        
        # R2
        R2 = r^2

        # RMSE
        RMSE  = sqrt(mean(derror.^2))

        push!(date_rmse, RMSE)
        push!(date_NSE, NSE)
        push!(date_kge, KGE12)
        push!(date_R2, R2)
    end

    # Error data to TimeArray
    error_data = (datetime = seeding_start:seeding_end,
    R2    = date_R2,
    RMSE  = date_rmse,
    NSE   = date_NSE,
    KGE12 = date_kge)
    error_ta = TimeArray(error_data; timestamp = :datetime)

    return error_ta
end