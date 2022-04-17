        Write-Output ${{ inputs.zerotier_TIMEOUT }} | Set-Variable -Name time -PassThru
        if ( '${{ runner.os }}' -eq 'Windows' ){
          zerotier = "cmd zerotier-cli"
        }
        if ( ( '${{ runner.os }}' -eq 'Linux' ) -or ( '${{ runner.os}}' -eq 'macOS') ){
          zerotier = "sudo zerotier-cli"
        }
        while ( ( Test-Path -Path $continue_path ) -and ( $time -gt 1  ) ){
          Write-Output ""
          Write-Output "#########################################"
          Write-Output "# zerotier listnetworks:"
          Write-Output "#########################################"
          Invoke-Expression $zerotier listnetworks
          Write-Output "#########################################"
          Write-Output "# zerotier peers:"
          Write-Output "#########################################"
          Invoke-Expression $zerotier peers
          Write-Output "#########################################"
          Write-Output "# zerotier listpeers:"
          Write-Output "#########################################"
          Invoke-Expression $zerotier listpeers
          Write-Output "#########################################"
          Write-Output "# Allow workflow to continue using:"
          Write-Output "#########################################"
          Write-Output "bash -c \"touch $continue_path\""
          Write-Output "#########################################"
          Write-Output "# SSH session time left:"
          Write-Output "########################################"
          printf '#%-14s%dh:%02dm:%02ds%-14s#\n' '' $(($time/3600)) $(($time%3600/60)) $(($time%60)) ''
          Write-Output "########################################"
          Write-Output ""          
          sleep 60
          time = $($time-60)
        }
        Write-Output "# SSH session terminated. Allowing workflow to continue..."


    - name: Start SSH session
      uses: luchihoratiu/debug-via-ssh@main
      if: |
        matrix.runon == 'windows'
        ${{ failure() }}
      with:
        NGROK_AUTH_TOKEN: "22SNO8KcDq55CgkjOgVGOixDedd_2S8m1YLWgJVGTBKriDMr4"
        SSH_PASS: "ffg476vD87XY"
