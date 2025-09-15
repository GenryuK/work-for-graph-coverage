for i in $(seq 1 100)
do
  QUERY_FILE="../dataset/wordnet/query_genryu/query_32_${i}.graph"

  # filterのループ {NON, VEQ}
  for filter in NON VEQ
  do
    # orderのループ {DEG, CFL}
    for order in DEG CFL
    do
      # engineのループ {MM, MMI, MatCo}
      for engine in MM MMI MatCo
      do
        echo "Processing ${QUERY_FILE} with filter: ${filter}, order: ${order}, engine: ${engine}..."
        ./matching/SubgraphMatching.out -d ../dataset/wordnet/data_graph/wordnet.graph \
                                       -q "${QUERY_FILE}" \
                                       -filter "${filter}" \
                                       -order "${order}" \
                                       -engine "${engine}" \
                                       -num -1 \
                                       -symmetry 1 \
                                       -FairT 2 \
                                       -time 100 \
                                       -SF Coverage \
                                       -o /home/kuraya/ML_coverage/SubgraphMatchingSurvey-main/vlabel/output/wordnet/wordnet_32_new.csv
      done
    done
  done
done

echo "All queries and combinations finished."