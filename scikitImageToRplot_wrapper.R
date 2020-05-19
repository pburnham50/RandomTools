### Phil Burnham, 2020

# function to plot intensity image from feature extraction output of 
# scikit image impropts.

# Input is a row from the image properties tabe

featureIntensity = function(image.select){
  remove_str = gsub("\n","",image.select["intensity_image"])
  break_up = strsplit(remove_str, split = "]")
  tot.len = (length(break_up[[1]])-1)
  im.fin = c()
  for (i in 1:tot.len){
    remove_brk = gsub("\\[|\\]","",unlist(break_up)[[i]])
    num.vec = as.numeric(as.matrix(unlist(strsplit(gsub("\\s+", ",", gsub("^\\s+|\\s+$", "",remove_brk)), 
                                                   split = ","))))
    im.fin = rbind(im.fin,num.vec)
  }
  print(image(im.fin,col = gray.colors(12, rev = F)))
}

