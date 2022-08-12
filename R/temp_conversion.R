#' MarkerIntensityScan
#'
#' Scan all cells to detect those with high levels of a chosen marker gene
#' @param gene Marker gene of interest
#' @param data scRNAseq S4 Seurat object of single cell data after normalization
#' @param method Normalization methods and outlier detection of choice. 'SCTransform', 'RandomForest', 'scone'
#' @return A vector of barcodes of cells with outlier marker gene expression
#' @examples
#' outliers <- CellMarkerScan("IFNG",data,method="scone");
#' @export
MarkerIntensityScan <- function(gene,data,method){
  if(method=='SCTransform'){
    print("Rashi's implementation")
  }
  else if(method=='RandomForest'){

  }
  else if(method==scRecover){
  x1=as.matrix(data@assays$RNA@counts)
  index=match(gene,row.names(x1))
  #scRecover(counts = x1, Kcluster = 1, outputDir = "./outDir_scRecover/", verbose = FALSE)
  ret=colnames(subset(x1,x1[index,]>quantile(x1[index,],.95)))
  }
  else{
    print("Error: Please refer to the manual and specify outlier detection method")
  }
  return(ret)
}

