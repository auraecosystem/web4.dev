// Create session with advanced configuration
const sessionConfig = {
  session: {
    recording: {active: false}, // Disable session recording
    proxy: {
      active: true,
      country_code: "us",
    },
    timeout: {
      max_duration: 5, // 5 minutes
      idle_timeout: 1, // 1 minute
    }
  },
};

const configuredSession = await anchorClient.sessions.create(sessionConfig);
const result = await anchorClient.agent.task(
  "What is my IP address and where am I?",
  {
  sessionId: configuredSession.data.id,
});
console.log(result);
