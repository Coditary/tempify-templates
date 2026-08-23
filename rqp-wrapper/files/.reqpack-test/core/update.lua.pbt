return {
  name = "{{ system_name }} update",
  request = {
    action = "update",
    system = "{{ system_name }}",
    packages = {
      { name = "example-pkg" }
    },
  },
  fakeExec = {
    {
      match = "{{ system_name }} update example-pkg",
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
