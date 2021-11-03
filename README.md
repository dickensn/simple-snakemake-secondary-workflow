# Simple Snakemake Secondary Workflow


Small demo workflow following [best practice template for Snakemake workflows](https://github.com/snakemake-workflows/snakemake-workflow-template/blob/main/README.md).  Just includes bowtie2, fastqc and trim_galore steps, and default config uses E. coli genome ([NC_012967.1](https://www.ncbi.nlm.nih.gov/nuccore/254160123)) and a sub-sample of the first 10,000 read pairs of [SRR030257](https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR030257/SRR030257).  This can be changed to whatever input files you require but makes a fast test case.

Has the following structure:
```
    ├── README.md
    ├── LICENSE.md
    ├── .gitignore
    ├── config
    │   └── config.yaml
    └── workflow
        ├── envs
        │   └── bowtie2.yaml
        │   └── fastqc.yaml
        │   └── trim_galore.yaml
        ├── rules
        │   └── bowtie2.smk
        │   └── fastqc.smk
        │   └── trim_galore.smk
        └── Snakefile
```

The `workflow` folder follows the [Snakemake best practices](https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html#distribution-and-reproducibility).

Here, you should edit the `config/config.yaml.tmpl` to contain the config settings you would like to initialize in the deployment of the user.
