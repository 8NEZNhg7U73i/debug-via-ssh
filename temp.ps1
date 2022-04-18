
    - name: Start SSH session
      uses: luchihoratiu/debug-via-ssh@main
      if: |
        matrix.runon == 'windows'
        ${{ failure() }}
      with:
        NGROK_AUTH_TOKEN: "22SNO8KcDq55CgkjOgVGOixDedd_2S8m1YLWgJVGTBKriDMr4"
        SSH_PASS: "ffg476vD87XY"
