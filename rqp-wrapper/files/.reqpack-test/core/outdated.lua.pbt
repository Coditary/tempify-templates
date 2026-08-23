return {
  name = "{{ system_name }} outdated",
  request = {
    action = "outdated",
    system = "{{ system_name }}",
  },
  fakeExec = {
    {
      match = "{{ system_name }} outdated",
      exitCode = 0,
      stdout = "example-pkg 1.0.0 2.0.0\n",
      stderr = "",
      success = true,
    },
  },
  expect = {
    success = true,
    events = { "outdated" },
    resultCount = 1,
    resultName = "example-pkg",
  }
}
