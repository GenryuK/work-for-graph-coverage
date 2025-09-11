for i in $(seq 1 50)
do
  QUERY_FILE="../dataset/dblp/query_genryu/query_24_${i}.graph"
  echo "Processing ${QUERY_FILE} ..."
  ./matching/SubgraphMatching.out -d ../dataset/dblp/data_graph/dblp.graph -q "${QUERY_FILE}" -filter VEQ -order CFL -engine MMI -num -1 -symmetry 1 -FairT 2 -time 100 -SF Coverage -o /home/kuraya/MandM/Mix-Match/SubgraphMatchingSurvey-main/vlabel/output/db_genryu_24_MMI.csv
done

echo "All queries finished."