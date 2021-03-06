% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/split_fasta.R
\name{split_fasta}
\alias{split_fasta}
\title{Split a fasta formatted file.}
\usage{
split_fasta(
  path_in,
  path_out,
  num_seq = 20000,
  trim = FALSE,
  trunc = NULL,
  id = FALSE
)
}
\arguments{
\item{path_in}{A path to the .FASTA formatted file that is to be processed}

\item{path_out}{A path where the resulting .FASTA formatted files should be stored. The path should also contain the prefix name of the fasta files on which _n (integer from 1 to number of fasta files generated) will be appended along with the extension ".fa"}

\item{num_seq}{Integer defining the number of sequences to be in each resulting .fasta file. Defaults to 20000.}

\item{trim}{Logical, should the sequences be trimmed to 4000 amino acids to bypass the CBS server restrictions. Defaults to FALSE.}

\item{trunc}{Integer, truncate the sequences to this length. First 1:trunc amino acids will be kept.}

\item{id}{Logical, should the protein id's be returned. Defaults to FALSE.}
}
\value{
if id = FALSE, A Character vector of the paths to the resulting .FASTA formatted files.

if id = TRUE, A list with two elements:
\describe{
  \item{id}{Character, protein identifiers.}
  \item{file_list}{Character, paths to the resulting .FASTA formatted files.}
  }
}
\description{
The function splits a fasta formatted file to a defined number of smaller .fasta files for further processing.
}
\examples{
\dontrun{
library(ragp)
#create a fasta file to be processed, not needed if the input file is already present
data(at_nsp)
library(seqinr)
write.fasta(sequence = strsplit(at_nsp$sequence, ""),
            name = at_nsp$Transcript.id,
            file = "at_nsp.fasta")

#assumes input/output file are in working directory:
file_paths <- split_fasta(path_in = "at_nsp.fasta",
                          path_out = "at_nsp_split",
                          num_seq = 500)
}

}
