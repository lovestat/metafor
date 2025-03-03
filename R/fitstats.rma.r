fitstats.rma <- function(object, ..., REML) {

   mstyle <- .get.mstyle("crayon" %in% .packages())

   .chkclass(class(object), must="rma")

   ### unless REML argument is specified, method of first object determines
   ### whether to show fit statistics based on the ML or REML likelihood

   if (missing(REML)) {
      if (object$method == "REML") {
         REML <- TRUE
      } else {
         REML <- FALSE
      }
   }

   if (missing(...)) {

      ### if there is just 'object'

      if (REML) {
         out <- cbind(object$fit.stats$REML)
         colnames(out) <- "REML"
      } else {
         out <- cbind(object$fit.stats$ML)
         colnames(out) <- "ML"
      }

   } else {

      ### if there is 'object' and additional objects via ...

      if (REML) {
         out <- sapply(list(object, ...), function(x) x$fit.stats$REML)
      } else {
         out <- sapply(list(object, ...), function(x) x$fit.stats$ML)
      }

      out <- data.frame(out)

      ### get names of objects; same idea as in stats:::AIC.default

      cl <- match.call()
      cl$REML <- NULL
      names(out) <- as.character(cl[-1L])

      ### check that all models were fitted to the same data

      yis <- lapply(list(object, ...), function(x) as.vector(x$yi))
      if (!all(sapply(yis[-1], function(x) identical(x, yis[[1]]))))
         warning(mstyle$warning("Models not all fitted to the same data."), call.=FALSE)

   }

   rownames(out) <- c("logLik:", "deviance:", "AIC:", "BIC:", "AICc:")
   return(out)

   #print(.fcf(out, object$digits[["fit"]]), quote=FALSE)
   #invisible(out)

}
