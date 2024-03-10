while IFS=$'\t' read -r col1 col2 col3; do
    # Find the maximum value among the three columns
    max_value=$((col1 > col2 ? (col1 > col3 ? col1 : col3) : (col2 > col3 ? col2 : col3)))

    # Increment the counters for columns with the maximum value
    if [ "$col1" -eq "$max_value" ]; then
        ((count_col1++))
    fi
    if [ "$col2" -eq "$max_value" ]; then
        ((count_col2++))
    fi
    if [ "$col3" -eq "$max_value" ]; then
        ((count_col3++))
    fi
done < output.weights2.txt

# Print the results
echo "Column 1 has the highest value $count_col1 times"
echo "Column 2 has the highest value $count_col2 times"
echo "Column 3 has the highest value $count_col3 times"
