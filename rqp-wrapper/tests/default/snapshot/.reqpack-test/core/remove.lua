return {
  name = "apt remove",
  request = {
    action = "remove",
    system = "apt",
    packages = {
      { name = "example-pkg" }
    },
  },
  fakeExec = {
    {
      match = "apt remove example-pkg",
      exitCode = 0,
      stdout = "removed\n",
      stderr = "",
      success = true,
    },
  },
  expect = {
    success = true,
    events = { "deleted", "success" },
    eventPayloads = {
      success = "ok",
    },
  }
}
