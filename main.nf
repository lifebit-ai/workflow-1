process generate_random_table {
    publishDir "${params.outdir}", mode: 'copy'
    container 'quay.io/lifebitaiorg/ubuntu:18.10'

    output:
    file("random_table.csv")

    script:
    """
    touch random_table.csv
    for (( i=1; i<=${params.number_of_rows}; i++ )); do
        row=(\$(shuf -i 1-100 -n 3))
        echo "\${row[0]},\${row[1]},\${row[2]}" >> random_table.csv
    done
    """
}