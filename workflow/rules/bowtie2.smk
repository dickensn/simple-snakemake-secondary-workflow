import multiprocessing

rule bowtie2:
    input:
        config["RESULTPATH"] + "/{FILE}_1_val_1.fq.gz",
        config["RESULTPATH"] + "/{FILE}_2_val_2.fq.gz",
        config["RESULTPATH"] + "/{FILE}_1_val_1_fastqc.html",
        config["RESULTPATH"] + "/{FILE}_2_val_2_fastqc.html",
        "resources/" + config["REFTAG"] + ".1.bt2",
        "resources/" + config["REFTAG"] + ".2.bt2",
        "resources/" + config["REFTAG"] + ".3.bt2",
        "resources/" + config["REFTAG"] + ".4.bt2",
        "resources/" + config["REFTAG"] + ".rev.1.bt2",
        "resources/" + config["REFTAG"] + ".rev.2.bt2"
    output:
        config["RESULTPATH"] + "/{FILE}.bam"
    conda:
        "../envs/bowtie2.yaml"
    params:
        ref=config["REFTAG"],
    threads: min(4, workflow.cores)
    resources:
        mem_mb=1024
    shell:
        "cp {input[2]} . && "
        "cp {input[3]} . && "
        "cp {input[4]} . && "
        "cp {input[5]} . && "
        "cp {input[6]} . && "
        "cp {input[7]} . && "
        "bowtie2 -p {threads} -t -x {params.ref} -1 {input[0]} -2 {input[1]} | samtools view -b -o {output[0]} -"

rule bowtie2_index:
    input:
        "resources/" + config["REFTAG"] +".fa"
    output:
        "resources/" + config["REFTAG"] + ".1.bt2",
        "resources/" + config["REFTAG"] + ".2.bt2",
        "resources/" + config["REFTAG"] + ".3.bt2",
        "resources/" + config["REFTAG"] + ".4.bt2",
        "resources/" + config["REFTAG"] + ".rev.1.bt2",
        "resources/" + config["REFTAG"] + ".rev.2.bt2",
    conda:
        "../envs/bowtie2.yaml"
    params:
        label=config["REFTAG"]
    resources:
        mem_mb=1024
    shell:
        "bowtie2-build -f {input} {params.label} && "
        "mv {params.label}.1.bt2 {output[0]} && "
        "mv {params.label}.2.bt2 {output[1]} && "
        "mv {params.label}.3.bt2 {output[2]} && "
        "mv {params.label}.4.bt2 {output[3]} && "
        "mv {params.label}.rev.1.bt2 {output[4]} && "
        "mv {params.label}.rev.2.bt2 {output[5]}"
