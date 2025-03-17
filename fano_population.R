# Averaging Fano population data near the outbreak epicentre
# Source: https://ec.europa.eu/eurostat/statistics-explained/index.php?oldid=596753

# 64 high-low density tiles selected around Fano
# each tile is has a measure of 1 sq.km. 
fano_pop_dens <- c(52, 42, 48, 559, 11, 22, 44, 232, 573, 1086, 172, 47, 53, 38, 72,
                   18, 148, 194, 16, 366, 28, 98, 892, 94, 147, 963, 78, 215, 41, 279, 431, 698,
                   78, 816, 818, 1362, 2713, 1229, 963, 78, 215, 41, 279, 431, 698, 78, 3187, 5086,
                   5601, 3843, 0, 110, 57, 296, 70, 1544, 5434, 4822, 1324, 862, 6, 1321, 2110, 250)

mean_dens_one_sq <- mean(fano_pop_dens)
mean_dens_four_sq <- 4*mean_dens_one_sq # converting to 4 sq.km.
mean_dens_four_sq

# only 20 high density tiles are selected around Fano epicentre
# each tile is has a measure of 1 sq.km. 

second_estimate = c(818, 3187, 1544, 1362, 5086, 5434, 1321, 2713, 5601,
                    4822, 1324, 862, 1229, 3843, 296, 892, 963, 366,
                    698, 215)

mean_fano_one_sqkm <- mean(second_estimate)
mean_fano_four_sqkm <- 4*round(mean_fano_one_sqkm) # converting to 4 sq.km.
mean_fano_four_sqkm