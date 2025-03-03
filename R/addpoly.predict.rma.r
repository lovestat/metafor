addpoly.predict.rma <- function(x,
rows=-2,                annotate, addpred=FALSE, digits, width, mlab,
transf, atransf, targs, efac, col, border, lty, fonts, cex, ...) {

   #########################################################################

   mstyle <- .get.mstyle("crayon" %in% .packages())

   .chkclass(class(x), must="predict.rma")

   if (x$pred.type == "scale")
      stop(mstyle$stop("Cannot add polygons based on predicted scale values."))

   if (missing(annotate))
      annotate <- .getfromenv("forest", "annotate", default=TRUE)

   if (missing(digits))
      digits <- .getfromenv("forest", "digits", default=2)

   if (missing(width))
      width <- .getfromenv("forest", "width", default=NULL)

   if (missing(mlab))
      mlab <- NULL

   if (missing(transf))
      transf <- .getfromenv("forest", "transf", default=FALSE)

   if (missing(atransf))
      atransf <- .getfromenv("forest", "atransf", default=FALSE)

   if (missing(targs))
      targs <- .getfromenv("forest", "targs", default=NULL)

   if (missing(efac))
      efac <- .getfromenv("forest", "efac", default=1)

   if (missing(col))
      col <- "black"

   if (missing(border))
      border <- "black"

   if (missing(lty))
      lty <- "dotted"

   if (missing(fonts))
      fonts <- .getfromenv("forest", "fonts", default=NULL)

   if (missing(cex))
      cex <- .getfromenv("forest", "cex", default=NULL)

   if (addpred) {
      pi.lb <- x$pi.lb
      pi.ub <- x$pi.ub
   } else {
      pi.lb <- rep(NA, length(x$pred))
      pi.ub <- rep(NA, length(x$pred))
   }

   #########################################################################

   addpoly(x$pred, ci.lb=x$ci.lb, ci.ub=x$ci.ub, pi.lb=pi.lb, pi.ub=pi.ub,
           rows=rows,             annotate=annotate, digits=digits, width=width,
           mlab=mlab, transf=transf, atransf=atransf, targs=targs,
           efac=efac, col=col, border=border, lty=lty, fonts=fonts, cex=cex, ...)

}
