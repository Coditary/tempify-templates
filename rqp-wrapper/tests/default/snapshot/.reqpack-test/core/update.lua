return {
  name = "apt update",
  request = {
    action = "update",
    system = "apt",
    packages = {
      { name = "example-pkg" }
    },
  },
  fakeExec = {
    {
      match = "apt update example-pkg",
      exitCode = 0,
      stdout = "updated\n",
      stderr = "",
      success = true,
    },
  },
  expect = {
    success = true,
    events = { "updated", "success" },
    eventPayloads = {
      success = "ok",
    },
  }
}
