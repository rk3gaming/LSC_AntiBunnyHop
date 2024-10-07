local NumberJump = 50

Citizen.CreateThread(function()
  local Jump = 0
  while true do

      Citizen.Wait(1)

      local ped = PlayerPedId()

      if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then

        Jump = Jump + 1

          if Jump == NumberJump then
            ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.30)
            
                  lib.notify({
                  id = 'anti_bunny_hop',
                  title = 'Realism',
                  description = "You have been bunnyhopping way too much, relax.",
                  showDuration = false,
                  position = 'top-right',
                  style = {
                      backgroundColor = '#020202',
                      color = '#C1C2C5',
                      ['.description'] = {
                        color = '#909296'
                      }
                  },
                  icon = 'person-falling', 
                  iconColor = '#db9e19'
              })

              SetPedToRagdoll(ped, 5000, 1400, 2)

              Jump = 0
          end

      else 

          Citizen.Wait(500)
          
      end
  end
end)
