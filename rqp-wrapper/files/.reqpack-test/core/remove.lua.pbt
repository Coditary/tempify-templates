return {
  name = "{{ system_name }} remove",
  request = {
    action = "remove",
    system = "{{ system_name }}",
    packages = {
      { name = "example-pkg" }
    },
  },
  fakeExec = {
    {
      match = "{{ system_name }} remove example-pkg",
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
