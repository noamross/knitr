% Please edit documentation in R/citation.R
\name{write_bib}
\alias{write_bib}
\title{Generate BibTeX bibliography databases for R packages}
\usage{
write_bib(x = .packages(), file = "", tweak = TRUE, 
    prefix = getOption("knitr.bib.prefix", "R-"))
}
\arguments{
\item{x}{package names (packages which are not installed are ignored)}

\item{file}{the (\file{.bib}) file to write (by default writes to the R
console; ignored if it is \code{NULL})}

\item{tweak}{whether to fix some known problems in the citations, especially
non-standard format of authors}

\item{prefix}{a prefix string for keys in BibTeX entries; by default, it is
\samp{R-} unless \code{\link{option}('knitr.bib.prefix')} has been set to
another string}
}
\value{
a list containing the citations (also written to the \code{file} as a
  side effect)
}
\description{
This function uses \code{\link[utils]{citation}} and
\code{\link[utils]{toBibtex}} to create bib entries for R packages and write
them in a file. Only the auto-generated citations are included for a package.
This function can facilitate the auto-generation of bibliography databases
for R packages, and it is easy to regenerate all the citations after updating
R packages.
}
\details{
The citation is forced to be generated from the DESCRIPTION file of the
package. The keyword \samp{R-pkgname} is used for the bib item, where
\samp{pkgname} is the name of the package.
}
\note{
Some packages on CRAN do not have standard bib entries, which was once
  reported by Michael Friendly at
  \url{https://stat.ethz.ch/pipermail/r-devel/2010-November/058977.html}. I
  find this a real pain, and there are no easy solutions except contacting
  package authors to modify their DESCRIPTION files. Anyway, the argument
  \code{tweak} has provided ugly hacks to deal with packages which are known
  to be non-standard in terms of the format of citations; \code{tweak = TRUE}
  is by no means intended to hide or modify the original citation
  information. It is just due to the loose requirements on package authors
  for the DESCRIPTION file. On one hand, I apologize if it really mangles the
  information about certain packages; on the other, I strongly recommend
  package authors to consider the \samp{Authors@R} field (see the manual
  \emph{Writing R Extensions}) to make it easier for other people to cite R
  packages. See \code{knitr:::.tweak.bib} for details of tweaks. Also note
  this is subject to future changes since R packages are being updated. If
  you want to contribute more tweaks, please edit the file
  \file{inst/misc/tweak_bib.csv} in the source package.
}
\examples{
write_bib(c("RGtk2", "gWidgets"), file = "R-GUI-pkgs.bib")
write_bib(c("animation", "rgl", "knitr", "ggplot2"))
write_bib(c("base", "parallel", "MASS"))  # base and parallel are identical
write_bib("cluster", prefix = "")  # a empty prefix
write_bib("digest", prefix = "R-pkg-")  # a new prefix
write_bib("digest", tweak = FALSE)  # original version

# what tweak=TRUE does
str(knitr:::.tweak.bib)
}
\author{
Yihui Xie and Michael Friendly
}
