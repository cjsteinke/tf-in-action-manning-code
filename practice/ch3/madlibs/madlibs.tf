terraform {
  required_version = ">= 0.15"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

variable "words" {
  description = "A word pool to use for Mad Libs"
  type = object(
    {
      nouns      = list(string),
      adjectives = list(string),
      verbs      = list(string),
      adverbs    = list(string),
      numbers    = list(number),
    })

  validation {
    condition     = length(var.words["nouns"]) >= 12
    error_message = "At least 20 nouns must be supplied."  
  }
}

variable "num_files" {
  default = 100
  type    = number
}

locals {
  uppercase_words = {for k, v in var.words : k => [for s in v : upper(s)]}
}

locals {
  templates = tolist(fileset(path.module, "templates/*.txt"))
}

resource "random_shuffle" "random_nouns" {
    count = var.num_files
    input = var.words["nouns"]
}

resource "random_shuffle" "random_adjectives" {
    count = var.num_files
    input = var.words["adjectives"]
}

resource "random_shuffle" "random_verbs" {
    count = var.num_files
    input = var.words["adjectives"]
}

resource "random_shuffle" "random_adverbs" {
    count = var.num_files
    input = var.words["adverbs"]
}

resource "random_shuffle" "random_numbers" {
    count = var.num_files
    input = var.words["numbers"]
}

resource "local_file" "mad_libs" {
  count    = var.num_files
  filename = "madlibs/madlibs-${count.index}.txt"
  content = templatefile(element(local.templates, count.index),
    {
      nouns      = random_shuffle.random_nouns[count.index].result
	    adjectives = random_shuffle.random_adjectives[count.index].result
	    verbs      = random_shuffle.random_verbs[count.index].result
	    adverbs    = random_shuffle.random_adverbs[count.index].result
	    numbers    = random_shuffle.random_numbers[count.index].result
    })
}

data "archive_file" "mad_libs" {
  depends_on  = [local_file.mad_libs]
  type        = "zip"
  source_dir  = "${path.module}/madlibs"
  output_path = "${path.cwd}/madlibs.zip"    
} 


