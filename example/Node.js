(async () => {
  // Simple navigation task
  const result = await anchorClient.agent.task(
    "go to news.ycombinator.com and get the title of the first story"
  );
  console.log("Task result:", result);
  
  // Task with execution step monitoring
  const executionStepLogs = [];
  const navigationResult = await anchorClient.agent.task(
    "go to news.ycombinator.com and get the title of the first story",
    {
      taskOptions: {
        onAgentStep: (executionStep) => {
          console.log("Agent step:", executionStep);
          executionStepLogs.push(executionStep);
        },
      },
    }
  );
  console.log("Navigation result:", navigationResult)
  console.log("Execution step logs count:", executionStepLogs.length)
  })();
