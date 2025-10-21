gh run list --branch "$(git branch --show-current)" \
  --json 'status,displayTitle,workflowName,headBranch,url,createdAt' | jq -r '
    (["Created At", "Title", "Branch", "Status", "Workflow", "URL"]),
     (.[] | [
        .createdAt,
        .displayTitle,
        .headBranch,
        .status,
        .workflowName,
        .url
    ])
    | @tsv
' | pandoc -f tsv -t markdown
