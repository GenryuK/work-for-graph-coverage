for i in $(seq 1 1)
do
  QUERY_FILE="../dataset/human/query_genryu/query_4_${i}.graph"
  for engine in QSI
  do
    echo "Processing ${QUERY_FILE} with engine ${engine}..."
    ./matching/SubgraphMatching.out -d ../dataset/human/data_graph/human.graph \
                                   -q "${QUERY_FILE}" \
                                   -filter TSO \
                                   -order TSO \
                                   -engine "${engine}" \
                                   -num -1 \
                                   -symmetry 1 \
                                   -FairT 2 \
                                   -time 100 \
                                   -SF Coverage \
                                   -o /home/kuraya/ML_coverage/SubgraphMatchingSurvey-main/vlabel/output/memo2.csv
  done
done

echo "All queries finished."