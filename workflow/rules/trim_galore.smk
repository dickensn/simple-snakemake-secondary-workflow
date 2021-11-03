rule trim_reads:
    input:
        "data/{FILE}_1.fastq.gz",
        "data/{FILE}_2.fastq.gz"
    output:
        "results/{FILE}_1_val_1.fq.gz",
        "results/{FILE}_2_val_2.fq.gz"
    conda:
        "../envs/trim_galore.yaml"
    params:
        opts = config.get("trim_galore_opts", "-q 20"),
        file1 = "{FILE}_1_val_1.fq.gz",
        file2 = "{FILE}_2_val_2.fq.gz"
    resources:
        mem_mb=1024
    threads: 1
    shell:
        "trim_galore {params.opts} --paired {input[0]} {input[1]} && "
        "mv {params.file1} {output[0]} && "
        "mv {params.file2} {output[1]}"
