#function to plot exploratory figure for body mass of adelie penguins on different islands
plot_adelie_figure_exploratory <- function(adelie_only){
  adelie_only %>% 
    ggplot(aes(x = island, y = body_mass_g)) +
    geom_bar(stat = "summary", fun = "mean", fill = "pink", color = "black", width = 0.5) +
    labs(title = "Mean Body Mass of Adelie Penguins by Island",
         x = "Island",
         y = "Mean Body Mass (g)") +
    theme_bw()
}



#function to plot results figure for body mass of adelie penguins on different islands
plot_adelie_figure_results <- function(adelie_with_pvalues){
  adelie_with_pvalues %>% 
    ggplot(aes(x = island, y = body_mass_g)) +
    geom_bar(stat = "summary", fun = "mean", fill = "lightblue", color = "black", width = 0.5) +
    labs(title = "Mean Body Mass of Adelie Penguins by Island",
         x = "Island",
         y = "Mean Body Mass (g)", subtitle ="Figure 2: Barplot showing mean body mass of Adelie penguins on 3 different islands +/- se. 
P-values refer to the results of linear model which provides a p-value for significance of 
difference in mean body mass (g) of Dream, and Torgersen islands, compared to Biscoe. 
P-value of ANOVA of linear model was 0.9685") +
    theme_bw() +
    geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.3, color = 'red', position = position_dodge(0.9)) +
    geom_text(data = unique(adelie_with_pvalues[, c("island", "p_value")]),
              aes(x = island, y = 3750, label = sprintf("p = %.3f", p_value)),
              position = position_dodge(0.9), vjust = -0.5, size = 3)
}

