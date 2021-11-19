rule fastqc_trimmed:
    input:
        config["RESULTPATH"] + "/{FILE}_1_val_1.fq.gz",
        config["RESULTPATH"] + "/{FILE}_2_val_2.fq.gz"
    output:
        config["RESULTPATH"] + "/{FILE}_1_val_1_fastqc.html",
        config["RESULTPATH"] + "/{FILE}_2_val_2_fastqc.html",
        config["RESULTPATH"] + "/{FILE}_1_fastqc/fastqc_data.txt",
        config["RESULTPATH"] + "/{FILE}_2_fastqc/fastqc_data.txt"
    conda:
        "../envs/fastqc.yaml"
    threads: 2
    resources:
        mem_mb=1024
    shell:
       "fastqc -t {threads} --extract {input}"
