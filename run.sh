CLOUDOS_URL="https://cloudos.lifebit.ai"
CLOUDOS_WORKSPACE="5c6d3e9bd954e800b23f8c62" # Lifebit Internal Production
CLOUDOS_PROJECT_NAME="automation_tests"
CLOUDOS_APIKEY="xxxxx" # Add your APIKEY here

CLOUDOS_OUTDIR="s3://lifebit-user-data-7e446a4f-7f51-49d2-95b5-b670a406cafa/deploit/teams/5c6d3e9bd954e800b23f8c62/users/5f156cc576b9280112c5358c/projects/5fd8783baec0ef0112b91f8a/jobs/64dcecfe8099a7d786dd6562"

# run workflow-1 https://github.com/lifebit-ai/workflow-1
cloudos job run \
    --cloudos-url $CLOUDOS_URL \
    --apikey $CLOUDOS_APIKEY \
    --workspace-id $CLOUDOS_WORKSPACE \
    --project-name $CLOUDOS_PROJECT_NAME \
    --workflow-name "workflow-1" \
    --job-name "workflow-1" \
    --parameter "number_of_rows=2" \
    --parameter "outdir=$CLOUDOS_OUTDIR" \
    --resumable \
    --wait-time 9000 \
    --batch \
    --wait-completion

# run workflow-2 https://github.com/lifebit-ai/workflow-2
cloudos job run \
    --cloudos-url $CLOUDOS_URL \
    --apikey $CLOUDOS_APIKEY \
    --workspace-id $CLOUDOS_WORKSPACE \
    --project-name $CLOUDOS_PROJECT_NAME \
    --workflow-name "workflow-2" \
    --job-name "workflow-2-use-workflow-1-output" \
    --parameter "input=$CLOUDOS_OUTDIR/random_table.csv" \
    --resumable \
    --wait-time 9000 \
    --batch \
    --wait-completion