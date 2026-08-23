return {
  name = "apt search",
  request = {
    action = "search",
    system = "apt",
    prompt = "example",
  },
  fakeExec = {
    {
      match = "apt search example",
      exitCode = 0,
      stdout = "example-pkg 1.0.0 Example package\n",
      stderr = "",
      success = true,
    },
  },
  expect = {
    success = true,
    events = { "searched" },
    resultCount = 1,
    resultName = "example-pkg",
  }
}
