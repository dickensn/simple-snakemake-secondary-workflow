```
conda activate snakemake

~/miniconda3/envs/snakemake/bin/snakemake \
--kubernetes --use-conda --default-remote-provider S3 \
--default-remote-prefix snakemakeonekscdkstack-snakemakebucketb248be87-1dq4yx0karb2p/workflow/ \
--jobs 4 \
--cores 2
```