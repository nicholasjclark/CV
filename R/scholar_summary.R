#### Plot citation metrics data from GoogleScholar User profiles ####
#'@param user Character string representing Google Scholar user profile ID
#'@return A \code{ggplot2} object showing a graph of citation metrics, with a timestamp
#' 
scholar_summary = function(user){
library(scholar)
cit <- scholar::get_citation_history(user)
tot <- scholar::get_num_articles(user) 
prof <- scholar::get_profile(user)

ggplot2:: ggplot(cit, ggplot2::aes(x = year, y = cites)) +
  ggplot2::geom_bar(stat = 'identity') +
  ggplot2::theme_bw() +
  ggplot2::xlab('Year') +
  ggplot2::ylab('Google Scholar\n citations')+
  ggplot2::annotate('text', label = format(Sys.time(), "%Y-%m-%d"),
           x = -Inf, y = Inf, vjust = 1.5, hjust = -0.08, size = 3) +
  ggplot2::annotate("text", x = -Inf, y = Inf, vjust = 3, hjust = -0.05, 
                    label = paste('Total papers = ', tot),
                    size = 3) +
  ggplot2::annotate("text", x = -Inf, y = Inf, vjust = 4, hjust = -0.05, 
           label = paste('Total citations = ', sum(cit$cites)),
           size = 3) +
  ggplot2::annotate("text", x = -Inf, y = Inf, vjust = 5.5, hjust = -0.12, 
                    label = paste('h_index = ', prof$h_index),
                    size = 3) + 
  ggplot2::annotate("text", x = -Inf, y = Inf, vjust = 6.5, hjust = -0.12, 
                    label = paste('i10_index = ', prof$i10_index),
                    size = 3) + 
  ggplot2::theme(panel.grid.major = ggplot2::element_blank(), 
                 panel.grid.minor = ggplot2::element_blank())
}