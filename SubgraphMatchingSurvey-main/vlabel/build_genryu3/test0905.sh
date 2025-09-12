for i in $(seq 1 50)
do
  QUERY_FILE="../dataset/human/query_genryu/query_4_${i}.graph"
  for filter in NON
  do
    echo "Processing ${QUERY_FILE} with engine ${engine}..."
    ./matching/SubgraphMatching.out -d ../dataset/human/data_graph/human.graph \
                                   -q "${QUERY_FILE}" \
                                   -filter "${filter}" \
                                   -order DEG \
                                   -engine "MatCo" \
                                   -num -1 \
                                   -symmetry 1 \
                                   -FairT 2 \
                                   -time 100 \
                                   -SF Coverage \
                                   -o /home/kuraya/ML_coverage/SubgraphMatchingSurvey-main/vlabel/output/memo4.csv
  done
done

echo "All queries finished."