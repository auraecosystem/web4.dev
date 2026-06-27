import fs from "fs/promises";

(async () => {
  // Create a session for screenshot
  const screenshotSession = await anchorClient.sessions.create();
  const screenshotBrowser = await anchorClient.browser.connect(screenshotSession.data.id);
  const screenshotPage = screenshotBrowser.contexts()[0].pages()[0];
  await screenshotPage.goto("https://example.com");

  // Capture screenshot from the session
  const screenshot = await anchorClient.tools.screenshotWebpage({
    sessionId: screenshotSession.data.id,
  });

  // Get screenshot data
  const buffer = await screenshot.arrayBuffer();
  console.log("Screenshot captured, size:", buffer.byteLength);

  // Save screenshot to file
  await fs.writeFile("screenshot.png", Buffer.from(buffer));
  console.log("Screenshot saved as screenshot.png");
})();
