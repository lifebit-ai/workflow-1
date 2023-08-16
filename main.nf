process generate_table {
    container 'quay.io/lifebitaiorg/ubuntu:18.10'

    shell:
    """
    touch table.csv
    for (( i=1; i<=${params.number_of_rows}; i++ )); do
        row=($(shuf -i 1-100 -n 3))
        echo "${row[0]},${row[1]},${row[2]}" >> table.csv
    done
    """
}