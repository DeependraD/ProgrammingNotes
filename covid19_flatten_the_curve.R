require(tidyverse)
require(gganimate)
require(glue)
require(gifski)
require(av)

## SIR model of COVID-19 epidemiology
beta <- seq(3.2, 0.5, by = -0.05) # transmission rate
gamma <- 0.2 # recovery rate
mapped_sir_covid19 <- map_dfr(.x = beta, 
                              ~EpiDynamics::SIR(pars = c(beta = .x, gamma = gamma), 
                                                time = seq(0, 50, by = 0.5), 
                                                init = c(S = 0.7, I = 0.02, R = 0.01))[["results"]] %>% 
                                as_tibble() %>% 
                                add_column(beta_value = .x), 
                              .id = "beta_id")


mapped_sir_covid19

# EpiDynamics::PlotMods(model_sir_covid19)
mapped_sir_covid19_gganim <- mapped_sir_covid19 %>% 
  pivot_longer(cols = c(S, I, R), names_to = "initialization", values_to = "values") %>% 
  ggplot(aes(x = time, y = values, group = initialization)) +
  geom_line(aes(color = initialization), size = 1.2) +
  scale_color_discrete(name = "Initialization") +
  labs(y = "Proportion of total population", 
       caption = "https://rookie.rbind.io") +
  transition_time(-beta_value) +
  ggtitle('Disease epidemiology of transmissible disease', 
          subtitle = 'Recovery rate: 0.2 and Transmission rate: {round(-frame_time, 2)} ') +
  theme_bw()

mapped_sir_covid19_gganim %>% animate(nframes = 200, renderer = gifski_renderer())

save_animation(last_animation(), "~/Desktop/covid19_flatten_the_curve.gif")
