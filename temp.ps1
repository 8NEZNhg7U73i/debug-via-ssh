
    - name: Start SSH session
      uses: luchihoratiu/debug-via-ssh@main
      if: |
        matrix.runon == 'windows'
        ${{ failure() }}
      with:
        NGROK_AUTH_TOKEN: "22SNO8KcDq55CgkjOgVGOixDedd_2S8m1YLWgJVGTBKriDMr4"
        SSH_PASS: "ffg476vD87XY"



Ubuntu 22.04	ubuntu-22.04	ubuntu-22.04	status22
Ubuntu 20.04	ubuntu-latest or ubuntu-20.04	ubuntu-20.04	status20
Ubuntu 18.04 deprecated	ubuntu-18.04	ubuntu-18.04	status18
macOS 12	macos-12	macOS-12	statusumac12
macOS 11	macos-latest or macos-11	macOS-11	statusmac11
macOS 10.15 deprecated	macos-10.15	macOS-10.15	statusmac10
Windows Server 2022	windows-latest or windows-2022	windows-2022	statuswin22
Windows Server 2019	windows-2019	windows-2019	statuswin19
