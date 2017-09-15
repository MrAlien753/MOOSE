--- **Core** -- **POINT\_VEC** classes define an **extensive API** to **manage 3D points** in the simulation space.
--
-- ![Banner Image](..\Presentations\POINT\Dia1.JPG)
--
-- ====
--
-- # Demo Missions
--
-- ### [POINT_VEC Demo Missions source code]()
--
-- ### [POINT_VEC Demo Missions, only for beta testers]()
--
-- ### [ALL Demo Missions pack of the last release](https://github.com/FlightControl-Master/MOOSE_MISSIONS/releases)
--
-- ====
--
-- # YouTube Channel
--
-- ### [POINT_VEC YouTube Channel]()
--
-- ===
--
-- ### Authors:
--
--   * FlightControl : Design & Programming
--
-- ### Contributions:
--
-- @module Point





do -- COORDINATE

  --- @type COORDINATE
  -- @extends Core.Base#BASE
  
  
  --- # COORDINATE class, extends @{Base#BASE}
  --
  -- COORDINATE defines a 3D point in the simulator and with its methods, you can use or manipulate the point in 3D space.
  --
  -- ## COORDINATE constructor
  --
  -- A new COORDINATE object can be created with:
  --
  --  * @{#COORDINATE.New}(): a 3D point.
  --  * @{#COORDINATE.NewFromVec2}(): a 2D point created from a @{DCSTypes#Vec2}.
  --  * @{#COORDINATE.NewFromVec3}(): a 3D point created from a @{DCSTypes#Vec3}.
  --
  -- ## Create waypoints for routes
  --
  -- A COORDINATE can prepare waypoints for Ground and Air groups to be embedded into a Route.
  --
  --   * @{#COORDINATE.WaypointAir}(): Build an air route point.
  --   * @{#COORDINATE.WaypointGround}(): Build a ground route point.
  --
  -- Route points can be used in the Route methods of the @{Group#GROUP} class.
  --
  --
  -- ## Smoke, flare, explode, illuminate
  --
  -- At the point a smoke, flare, explosion and illumination bomb can be triggered. Use the following methods:
  --
  -- ### Smoke
  --
  --   * @{#COORDINATE.Smoke}(): To smoke the point in a certain color.
  --   * @{#COORDINATE.SmokeBlue}(): To smoke the point in blue.
  --   * @{#COORDINATE.SmokeRed}(): To smoke the point in red.
  --   * @{#COORDINATE.SmokeOrange}(): To smoke the point in orange.
  --   * @{#COORDINATE.SmokeWhite}(): To smoke the point in white.
  --   * @{#COORDINATE.SmokeGreen}(): To smoke the point in green.
  --
  -- ### Flare
  --
  --   * @{#COORDINATE.Flare}(): To flare the point in a certain color.
  --   * @{#COORDINATE.FlareRed}(): To flare the point in red.
  --   * @{#COORDINATE.FlareYellow}(): To flare the point in yellow.
  --   * @{#COORDINATE.FlareWhite}(): To flare the point in white.
  --   * @{#COORDINATE.FlareGreen}(): To flare the point in green.
  --
  -- ### Explode
  --
  --   * @{#COORDINATE.Explosion}(): To explode the point with a certain intensity.
  --
  -- ### Illuminate
  --
  --   * @{#COORDINATE.IlluminationBomb}(): To illuminate the point.
  --
  --
  -- ## Markings
  -- 
  -- Place markers (text boxes with clarifications for briefings, target locations or any other reference point) on the map for all players, coalitions or specific groups:
  -- 
  --   * @{#COORDINATE.MarkToAll}(): Place a mark to all players.
  --   * @{#COORDINATE.MarkToCoalition}(): Place a mark to a coalition.
  --   * @{#COORDINATE.MarkToCoalitionRed}(): Place a mark to the red coalition.
  --   * @{#COORDINATE.MarkToCoalitionBlue}(): Place a mark to the blue coalition.
  --   * @{#COORDINATE.MarkToGroup}(): Place a mark to a group (needs to have a client in it or a CA group (CA group is bugged)).
  --   * @{#COORDINATE.RemoveMark}(): Removes a mark from the map.
  --   
  --
  -- ## 3D calculation methods
  --
  -- Various calculation methods exist to use or manipulate 3D space. Find below a short description of each method:
  --
  -- ### Distance
  --
  --   * @{#COORDINATE.Get3DDistance}(): Obtain the distance from the current 3D point to the provided 3D point in 3D space.
  --   * @{#COORDINATE.Get2DDistance}(): Obtain the distance from the current 3D point to the provided 3D point in 2D space.
  --
  -- ### Angle
  --
  --   * @{#COORDINATE.GetAngleDegrees}(): Obtain the angle in degrees from the current 3D point with the provided 3D direction vector.
  --   * @{#COORDINATE.GetAngleRadians}(): Obtain the angle in radians from the current 3D point with the provided 3D direction vector.
  --   * @{#COORDINATE.GetDirectionVec3}(): Obtain the 3D direction vector from the current 3D point to the provided 3D point.
  --
  -- ### Translation
  --
  --   * @{#COORDINATE.Translate}(): Translate the current 3D point towards an other 3D point using the given Distance and Angle.
  --
  -- ### Get the North correction of the current location
  --
  --   * @{#COORDINATE.GetNorthCorrection}(): Obtains the north correction at the current 3D point.
  --
  --
  -- ## Point Randomization
  --
  -- Various methods exist to calculate random locations around a given 3D point.
  --
  --   * @{#COORDINATE.GetRandomVec2InRadius}(): Provides a random 2D vector around the current 3D point, in the given inner to outer band.
  --   * @{#COORDINATE.GetRandomVec3InRadius}(): Provides a random 3D vector around the current 3D point, in the given inner to outer band.
  --
  --
  -- ## Metric system
  --
  --   * @{#COORDINATE.IsMetric}(): Returns if the 3D point is Metric or Nautical Miles.
  --   * @{#COORDINATE.SetMetric}(): Sets the 3D point to Metric or Nautical Miles.
  --
  --
  -- ## Coorinate text generation
  --
  --   * @{#COORDINATE.ToStringBR}(): Generates a Bearing & Range text in the format of DDD for DI where DDD is degrees and DI is distance.
  --   * @{#COORDINATE.ToStringLL}(): Generates a Latutude & Longutude text.
  --
  -- @field #COORDINATE
  COORDINATE = {
    ClassName = "COORDINATE",
  }


  --- COORDINATE constructor.
  -- @param #COORDINATE self
  -- @param Dcs.DCSTypes#Distance x The x coordinate of the Vec3 point, pointing to the North.
  -- @param Dcs.DCSTypes#Distance y The y coordinate of the Vec3 point, pointing to the Right.
  -- @param Dcs.DCSTypes#Distance z The z coordinate of the Vec3 point, pointing to the Right.
  -- @return #COORDINATE
  function COORDINATE:New( x, y, z ) 

    local self = BASE:Inherit( self, BASE:New() ) -- #COORDINATE
    self.x = x
    self.y = y
    self.z = z
    
    return self
  end

  --- Create a new COORDINATE object from  Vec2 coordinates.
  -- @param #COORDINATE self
  -- @param Dcs.DCSTypes#Vec2 Vec2 The Vec2 point.
  -- @param Dcs.DCSTypes#Distance LandHeightAdd (optional) The default height if required to be evaluated will be the land height of the x, y coordinate. You can specify an extra height to be added to the land height.
  -- @return #COORDINATE
  function COORDINATE:NewFromVec2( Vec2, LandHeightAdd ) 

    local LandHeight = land.getHeight( Vec2 )
    
    LandHeightAdd = LandHeightAdd or 0
    LandHeight = LandHeight + LandHeightAdd

    local self = self:New( Vec2.x, LandHeight, Vec2.y ) -- #COORDINATE

    self:F2( self )

    return self

  end

  --- Create a new COORDINATE object from  Vec3 coordinates.
  -- @param #COORDINATE self
  -- @param Dcs.DCSTypes#Vec3 Vec3 The Vec3 point.
  -- @return #COORDINATE
  function COORDINATE:NewFromVec3( Vec3 ) 

    local self = self:New( Vec3.x, Vec3.y, Vec3.z ) -- #COORDINATE

    self:F2( self )

    return self
  end
  

  --- Return the coordinates of the COORDINATE in Vec3 format.
  -- @param #COORDINATE self
  -- @return Dcs.DCSTypes#Vec3 The Vec3 format coordinate.
  function COORDINATE:GetVec3()
    return { x = self.x, y = self.y, z = self.z }
  end


  --- Return the coordinates of the COORDINATE in Vec2 format.
  -- @param #COORDINATE self
  -- @return Dcs.DCSTypes#Vec2 The Vec2 format coordinate.
  function COORDINATE:GetVec2()
    return { x = self.x, y = self.z }
  end

  --TODO: check this to replace
  --- Calculate the distance from a reference @{DCSTypes#Vec2}.
  -- @param #COORDINATE self
  -- @param Dcs.DCSTypes#Vec2 Vec2Reference The reference @{DCSTypes#Vec2}.
  -- @return Dcs.DCSTypes#Distance The distance from the reference @{DCSTypes#Vec2} in meters.
  function COORDINATE:DistanceFromVec2( Vec2Reference )
    self:F2( Vec2Reference )

    local Distance = ( ( Vec2Reference.x - self.x ) ^ 2 + ( Vec2Reference.y - self.z ) ^2 ) ^0.5

    self:T2( Distance )
    return Distance
  end


  --- Add a Distance in meters from the COORDINATE orthonormal plane, with the given angle, and calculate the new COORDINATE.
  -- @param #COORDINATE self
  -- @param Dcs.DCSTypes#Distance Distance The Distance to be added in meters.
  -- @param Dcs.DCSTypes#Angle Angle The Angle in degrees.
  -- @return #COORDINATE The new calculated COORDINATE.
  function COORDINATE:Translate( Distance, Angle )
    local SX = self.x
    local SY = self.z
    local Radians = Angle / 180 * math.pi
    local TX = Distance * math.cos( Radians ) + SX
    local TY = Distance * math.sin( Radians ) + SY

    return COORDINATE:NewFromVec2( { x = TX, y = TY } )
  end

  --- Return a random Vec2 within an Outer Radius and optionally NOT within an Inner Radius of the COORDINATE.
  -- @param #COORDINATE self
  -- @param Dcs.DCSTypes#Distance OuterRadius
  -- @param Dcs.DCSTypes#Distance InnerRadius
  -- @return Dcs.DCSTypes#Vec2 Vec2
  function COORDINATE:GetRandomVec2InRadius( OuterRadius, InnerRadius )
    self:F2( { OuterRadius, InnerRadius } )

    local Theta = 2 * math.pi * math.random()
    local Radials = math.random() + math.random()
    if Radials > 1 then
      Radials = 2 - Radials
    end

    local RadialMultiplier
    if InnerRadius and InnerRadius <= OuterRadius then
      RadialMultiplier = ( OuterRadius - InnerRadius ) * Radials + InnerRadius
    else
      RadialMultiplier = OuterRadius * Radials
    end

    local RandomVec2
    if OuterRadius > 0 then
      RandomVec2 = { x = math.cos( Theta ) * RadialMultiplier + self.x, y = math.sin( Theta ) * RadialMultiplier + self.z }
    else
      RandomVec2 = { x = self.x, y = self.z }
    end

    return RandomVec2
  end


  --- Return a random Vec3 within an Outer Radius and optionally NOT within an Inner Radius of the COORDINATE.
  -- @param #COORDINATE self
  -- @param Dcs.DCSTypes#Distance OuterRadius
  -- @param Dcs.DCSTypes#Distance InnerRadius
  -- @return Dcs.DCSTypes#Vec3 Vec3
  function COORDINATE:GetRandomVec3InRadius( OuterRadius, InnerRadius )

    local RandomVec2 = self:GetRandomVec2InRadius( OuterRadius, InnerRadius )
    local y = self.y + math.random( InnerRadius, OuterRadius )
    local RandomVec3 = { x = RandomVec2.x, y = y, z = RandomVec2.y }

    return RandomVec3
  end
  
  --- Return the height of the land at the coordinate.
  -- @param #COORDINATE self
  -- @return #number
  function COORDINATE:GetLandHeight()
    local Vec2 = { x = self.x, y = self.z }
    return land.getHeight( Vec2 )
  end


  --- Set the heading of the coordinate, if applicable.
  -- @param #COORDINATE self
  function COORDINATE:SetHeading( Heading )
    self.Heading = Heading
  end
  
  
  --- Get the heading of the coordinate, if applicable.
  -- @param #COORDINATE self
  -- @return #number or nil
  function COORDINATE:GetHeading()
    return self.Heading
  end

  
  --- Set the velocity of the COORDINATE.
  -- @param #COORDINATE self
  -- @param #string Velocity Velocity in meters per second.
  function COORDINATE:SetVelocity( Velocity )
    self.Velocity = Velocity
  end

  
  --- Return the velocity of the COORDINATE.
  -- @param #COORDINATE self
  -- @return #number Velocity in meters per second.
  function COORDINATE:GetVelocity()
    local Velocity = self.Velocity
    return Velocity or 0
  end

  
  --- Return velocity text of the COORDINATE.
  -- @param #COORDINATE self
  -- @return #string
  function COORDINATE:GetMovingText( Settings )

    return self:GetVelocityText( Settings ) .. ", " .. self:GetHeadingText( Settings )
  end


  --- Return a direction vector Vec3 from COORDINATE to the COORDINATE.
  -- @param #COORDINATE self
  -- @param #COORDINATE TargetCoordinate The target COORDINATE.
  -- @return Dcs.DCSTypes#Vec3 DirectionVec3 The direction vector in Vec3 format.
  function COORDINATE:GetDirectionVec3( TargetCoordinate )
    return { x = TargetCoordinate.x - self.x, y = TargetCoordinate.y - self.y, z = TargetCoordinate.z - self.z }
  end


  --- Get a correction in radians of the real magnetic north of the COORDINATE.
  -- @param #COORDINATE self
  -- @return #number CorrectionRadians The correction in radians.
  function COORDINATE:GetNorthCorrectionRadians()
    local TargetVec3 = self:GetVec3()
    local lat, lon = coord.LOtoLL(TargetVec3)
    local north_posit = coord.LLtoLO(lat + 1, lon)
    return math.atan2( north_posit.z - TargetVec3.z, north_posit.x - TargetVec3.x )
  end


  --- Return an angle in radians from the COORDINATE using a direction vector in Vec3 format.
  -- @param #COORDINATE self
  -- @param Dcs.DCSTypes#Vec3 DirectionVec3 The direction vector in Vec3 format.
  -- @return #number DirectionRadians The angle in radians.
  function COORDINATE:GetAngleRadians( DirectionVec3 )
    local DirectionRadians = math.atan2( DirectionVec3.z, DirectionVec3.x )
    --DirectionRadians = DirectionRadians + self:GetNorthCorrectionRadians()
    if DirectionRadians < 0 then
      DirectionRadians = DirectionRadians + 2 * math.pi  -- put dir in range of 0 to 2*pi ( the full circle )
    end
    return DirectionRadians
  end

  --- Return an angle in degrees from the COORDINATE using a direction vector in Vec3 format.
  -- @param #COORDINATE self
  -- @param Dcs.DCSTypes#Vec3 DirectionVec3 The direction vector in Vec3 format.
  -- @return #number DirectionRadians The angle in degrees.
  function COORDINATE:GetAngleDegrees( DirectionVec3 )
    local AngleRadians = self:GetAngleRadians( DirectionVec3 )
    local Angle = UTILS.ToDegree( AngleRadians )
    return Angle
  end


  --- Return the 2D distance in meters between the target COORDINATE and the COORDINATE.
  -- @param #COORDINATE self
  -- @param #COORDINATE TargetCoordinate The target COORDINATE.
  -- @return Dcs.DCSTypes#Distance Distance The distance in meters.
  function COORDINATE:Get2DDistance( TargetCoordinate )
    local TargetVec3 = TargetCoordinate:GetVec3()
    local SourceVec3 = self:GetVec3()
    return ( ( TargetVec3.x - SourceVec3.x ) ^ 2 + ( TargetVec3.z - SourceVec3.z ) ^ 2 ) ^ 0.5
  end


  --- Return the 3D distance in meters between the target COORDINATE and the COORDINATE.
  -- @param #COORDINATE self
  -- @param #COORDINATE TargetCoordinate The target COORDINATE.
  -- @return Dcs.DCSTypes#Distance Distance The distance in meters.
  function COORDINATE:Get3DDistance( TargetCoordinate )
    local TargetVec3 = TargetCoordinate:GetVec3()
    local SourceVec3 = self:GetVec3()
    return ( ( TargetVec3.x - SourceVec3.x ) ^ 2 + ( TargetVec3.y - SourceVec3.y ) ^ 2 + ( TargetVec3.z - SourceVec3.z ) ^ 2 ) ^ 0.5
  end


  --- Provides a bearing text in degrees.
  -- @param #COORDINATE self
  -- @param #number AngleRadians The angle in randians.
  -- @param #number Precision The precision.
  -- @param Core.Settings#SETTINGS Settings
  -- @return #string The bearing text in degrees.
  function COORDINATE:GetBearingText( AngleRadians, Precision, Settings )

    local Settings = Settings or _SETTINGS -- Core.Settings#SETTINGS

    local AngleDegrees = UTILS.Round( UTILS.ToDegree( AngleRadians ), Precision )
  
    local s = string.format( '%03d°', AngleDegrees ) 
    
    return s
  end

  --- Provides a distance text expressed in the units of measurement.
  -- @param #COORDINATE self
  -- @param #number Distance The distance in meters.
  -- @param Core.Settings#SETTINGS Settings
  -- @return #string The distance text expressed in the units of measurement.
  function COORDINATE:GetDistanceText( Distance, Settings )

    local Settings = Settings or _SETTINGS -- Core.Settings#SETTINGS

    local DistanceText

    if Settings:IsMetric() then
      DistanceText = " for " .. UTILS.Round( Distance / 1000, 2 ) .. " km"
    else
      DistanceText = " for " .. UTILS.Round( UTILS.MetersToNM( Distance ), 2 ) .. " miles"
    end
    
    return DistanceText
  end

  --- Return the altitude text of the COORDINATE.
  -- @param #COORDINATE self
  -- @return #string Altitude text.
  function COORDINATE:GetAltitudeText( Settings )
    local Altitude = self.y
    local Settings = Settings or _SETTINGS
    if Altitude ~= 0 then
      if Settings:IsMetric() then
        return " at " .. UTILS.Round( self.y, -3 ) .. " meters"
      else
        return " at " .. UTILS.Round( UTILS.MetersToFeet( self.y ), -3 ) .. " feet"
      end
    else
      return ""
    end
  end



  --- Return the velocity text of the COORDINATE.
  -- @param #COORDINATE self
  -- @return #string Velocity text.
  function COORDINATE:GetVelocityText( Settings )
    local Velocity = self:GetVelocity()
    local Settings = Settings or _SETTINGS
    if Velocity then
      if Settings:IsMetric() then
        return string.format( " moving at %d km/h", UTILS.MpsToKmph( Velocity ) )
      else
        return string.format( " moving at %d mi/h", UTILS.MpsToKmph( Velocity ) / 1.852 )
      end
    else
      return " stationary"
    end
  end


  --- Return the heading text of the COORDINATE.
  -- @param #COORDINATE self
  -- @return #string Heading text.
  function COORDINATE:GetHeadingText( Settings )
    local Heading = self:GetHeading()
    if Heading then
      return string.format( " bearing %3d°", Heading )
    else
      return " bearing unknown"
    end
  end


  --- Provides a Bearing / Range string
  -- @param #COORDINATE self
  -- @param #number AngleRadians The angle in randians
  -- @param #number Distance The distance
  -- @param Core.Settings#SETTINGS Settings
  -- @return #string The BR Text
  function COORDINATE:GetBRText( AngleRadians, Distance, Settings )

    local Settings = Settings or _SETTINGS -- Core.Settings#SETTINGS

    local BearingText = self:GetBearingText( AngleRadians, 0, Settings )
    local DistanceText = self:GetDistanceText( Distance, Settings )
    
    local BRText = BearingText .. DistanceText

    return BRText
  end

  --- Provides a Bearing / Range / Altitude string
  -- @param #COORDINATE self
  -- @param #number AngleRadians The angle in randians
  -- @param #number Distance The distance
  -- @param Core.Settings#SETTINGS Settings
  -- @return #string The BRA Text
  function COORDINATE:GetBRAText( AngleRadians, Distance, Settings )

    local Settings = Settings or _SETTINGS -- Core.Settings#SETTINGS

    local BearingText = self:GetBearingText( AngleRadians, 0, Settings )
    local DistanceText = self:GetDistanceText( Distance, Settings )
    local AltitudeText = self:GetAltitudeText( Settings )

    local BRAText = BearingText .. DistanceText .. AltitudeText -- When the POINT is a VEC2, there will be no altitude shown.

    return BRAText
  end



  --- Add a Distance in meters from the COORDINATE horizontal plane, with the given angle, and calculate the new COORDINATE.
  -- @param #COORDINATE self
  -- @param Dcs.DCSTypes#Distance Distance The Distance to be added in meters.
  -- @param Dcs.DCSTypes#Angle Angle The Angle in degrees.
  -- @return #COORDINATE The new calculated COORDINATE.
  function COORDINATE:Translate( Distance, Angle )
    local SX = self.x
    local SZ = self.z
    local Radians = Angle / 180 * math.pi
    local TX = Distance * math.cos( Radians ) + SX
    local TZ = Distance * math.sin( Radians ) + SZ

    return COORDINATE:New( TX, self.y, TZ )
  end



  --- Build an air type route point.
  -- @param #COORDINATE self
  -- @param #COORDINATE.RoutePointAltType AltType The altitude type.
  -- @param #COORDINATE.RoutePointType Type The route point type.
  -- @param #COORDINATE.RoutePointAction Action The route point action.
  -- @param Dcs.DCSTypes#Speed Speed Airspeed in km/h.
  -- @param #boolean SpeedLocked true means the speed is locked.
  -- @return #table The route point.
  function COORDINATE:WaypointAir( AltType, Type, Action, Speed, SpeedLocked )
    self:F2( { AltType, Type, Action, Speed, SpeedLocked } )

    local RoutePoint = {}
    RoutePoint.x = self.x
    RoutePoint.y = self.z
    RoutePoint.alt = self.y
    RoutePoint.alt_type = AltType or "RADIO"

    RoutePoint.type = Type or nil
    RoutePoint.action = Action or nil

    RoutePoint.speed = ( Speed and Speed / 3.6 ) or ( 500 / 3.6 )
    RoutePoint.speed_locked = true

    --  ["task"] =
    --  {
    --      ["id"] = "ComboTask",
    --      ["params"] =
    --      {
    --          ["tasks"] =
    --          {
    --          }, -- end of ["tasks"]
    --      }, -- end of ["params"]
    --  }, -- end of ["task"]


    RoutePoint.task = {}
    RoutePoint.task.id = "ComboTask"
    RoutePoint.task.params = {}
    RoutePoint.task.params.tasks = {}


    return RoutePoint
  end

  --- Build an ground type route point.
  -- @param #COORDINATE self
  -- @param #number Speed (optional) Speed in km/h. The default speed is 999 km/h.
  -- @param #string Formation (optional) The route point Formation, which is a text string that specifies exactly the Text in the Type of the route point, like "Vee", "Echelon Right".
  -- @return #table The route point.
  function COORDINATE:WaypointGround( Speed, Formation )
    self:F2( { Formation, Speed } )

    local RoutePoint = {}
    RoutePoint.x = self.x
    RoutePoint.y = self.z

    RoutePoint.action = Formation or ""


    RoutePoint.speed = ( Speed or 999 ) / 3.6
    RoutePoint.speed_locked = true

    --  ["task"] =
    --  {
    --      ["id"] = "ComboTask",
    --      ["params"] =
    --      {
    --          ["tasks"] =
    --          {
    --          }, -- end of ["tasks"]
    --      }, -- end of ["params"]
    --  }, -- end of ["task"]


    RoutePoint.task = {}
    RoutePoint.task.id = "ComboTask"
    RoutePoint.task.params = {}
    RoutePoint.task.params.tasks = {}


    return RoutePoint
  end

  --- Creates an explosion at the point of a certain intensity.
  -- @param #COORDINATE self
  -- @param #number ExplosionIntensity
  function COORDINATE:Explosion( ExplosionIntensity )
    self:F2( { ExplosionIntensity } )
    trigger.action.explosion( self:GetVec3(), ExplosionIntensity )
  end

  --- Creates an illumination bomb at the point.
  -- @param #COORDINATE self
  function COORDINATE:IlluminationBomb()
    self:F2()
    trigger.action.illuminationBomb( self:GetVec3() )
  end


  --- Smokes the point in a color.
  -- @param #COORDINATE self
  -- @param Utilities.Utils#SMOKECOLOR SmokeColor
  function COORDINATE:Smoke( SmokeColor )
    self:F2( { SmokeColor } )
    trigger.action.smoke( self:GetVec3(), SmokeColor )
  end

  --- Smoke the COORDINATE Green.
  -- @param #COORDINATE self
  function COORDINATE:SmokeGreen()
    self:F2()
    self:Smoke( SMOKECOLOR.Green )
  end

  --- Smoke the COORDINATE Red.
  -- @param #COORDINATE self
  function COORDINATE:SmokeRed()
    self:F2()
    self:Smoke( SMOKECOLOR.Red )
  end

  --- Smoke the COORDINATE White.
  -- @param #COORDINATE self
  function COORDINATE:SmokeWhite()
    self:F2()
    self:Smoke( SMOKECOLOR.White )
  end

  --- Smoke the COORDINATE Orange.
  -- @param #COORDINATE self
  function COORDINATE:SmokeOrange()
    self:F2()
    self:Smoke( SMOKECOLOR.Orange )
  end

  --- Smoke the COORDINATE Blue.
  -- @param #COORDINATE self
  function COORDINATE:SmokeBlue()
    self:F2()
    self:Smoke( SMOKECOLOR.Blue )
  end

  --- Flares the point in a color.
  -- @param #COORDINATE self
  -- @param Utilities.Utils#FLARECOLOR FlareColor
  -- @param Dcs.DCSTypes#Azimuth (optional) Azimuth The azimuth of the flare direction. The default azimuth is 0.
  function COORDINATE:Flare( FlareColor, Azimuth )
    self:F2( { FlareColor } )
    trigger.action.signalFlare( self:GetVec3(), FlareColor, Azimuth and Azimuth or 0 )
  end

  --- Flare the COORDINATE White.
  -- @param #COORDINATE self
  -- @param Dcs.DCSTypes#Azimuth (optional) Azimuth The azimuth of the flare direction. The default azimuth is 0.
  function COORDINATE:FlareWhite( Azimuth )
    self:F2( Azimuth )
    self:Flare( FLARECOLOR.White, Azimuth )
  end

  --- Flare the COORDINATE Yellow.
  -- @param #COORDINATE self
  -- @param Dcs.DCSTypes#Azimuth (optional) Azimuth The azimuth of the flare direction. The default azimuth is 0.
  function COORDINATE:FlareYellow( Azimuth )
    self:F2( Azimuth )
    self:Flare( FLARECOLOR.Yellow, Azimuth )
  end

  --- Flare the COORDINATE Green.
  -- @param #COORDINATE self
  -- @param Dcs.DCSTypes#Azimuth (optional) Azimuth The azimuth of the flare direction. The default azimuth is 0.
  function COORDINATE:FlareGreen( Azimuth )
    self:F2( Azimuth )
    self:Flare( FLARECOLOR.Green, Azimuth )
  end

  --- Flare the COORDINATE Red.
  -- @param #COORDINATE self
  function COORDINATE:FlareRed( Azimuth )
    self:F2( Azimuth )
    self:Flare( FLARECOLOR.Red, Azimuth )
  end
  
  do -- Markings
  
    --- Mark to All
    -- @param #COORDINATE self
    -- @param #string MarkText Free format text that shows the marking clarification.
    -- @return #number The resulting Mark ID which is a number.
    -- @usage
    --   local TargetCoord = TargetGroup:GetCoordinate()
    --   local MarkID = TargetCoord:MarkToAll( "This is a target for all players" )
    function COORDINATE:MarkToAll( MarkText )
      local MarkID = UTILS.GetMarkID()
      trigger.action.markToAll( MarkID, MarkText, self:GetVec3() )
      return MarkID
    end

    --- Mark to Coalition
    -- @param #COORDINATE self
    -- @param #string MarkText Free format text that shows the marking clarification.
    -- @param Coalition
    -- @return #number The resulting Mark ID which is a number.
    -- @usage
    --   local TargetCoord = TargetGroup:GetCoordinate()
    --   local MarkID = TargetCoord:MarkToCoalition( "This is a target for the red coalition", coalition.side.RED )
    function COORDINATE:MarkToCoalition( MarkText, Coalition )
      local MarkID = UTILS.GetMarkID()
      trigger.action.markToCoalition( MarkID, MarkText, self:GetVec3(), Coalition )
      return MarkID
    end

    --- Mark to Red Coalition
    -- @param #COORDINATE self
    -- @param #string MarkText Free format text that shows the marking clarification.
    -- @return #number The resulting Mark ID which is a number.
    -- @usage
    --   local TargetCoord = TargetGroup:GetCoordinate()
    --   local MarkID = TargetCoord:MarkToCoalitionRed( "This is a target for the red coalition" )
    function COORDINATE:MarkToCoalitionRed( MarkText )
      return self:MarkToCoalition( MarkText, coalition.side.RED )
    end

    --- Mark to Blue Coalition
    -- @param #COORDINATE self
    -- @param #string MarkText Free format text that shows the marking clarification.
    -- @return #number The resulting Mark ID which is a number.
    -- @usage
    --   local TargetCoord = TargetGroup:GetCoordinate()
    --   local MarkID = TargetCoord:MarkToCoalitionBlue( "This is a target for the blue coalition" )
    function COORDINATE:MarkToCoalitionBlue( MarkText )
      return self:MarkToCoalition( MarkText, coalition.side.BLUE )
    end

    --- Mark to Group
    -- @param #COORDINATE self
    -- @param #string MarkText Free format text that shows the marking clarification.
    -- @param Wrapper.Group#GROUP MarkGroup The @{Group} that receives the mark.
    -- @return #number The resulting Mark ID which is a number.
    -- @usage
    --   local TargetCoord = TargetGroup:GetCoordinate()
    --   local MarkGroup = GROUP:FindByName( "AttackGroup" )
    --   local MarkID = TargetCoord:MarkToGroup( "This is a target for the attack group", AttackGroup )
    function COORDINATE:MarkToGroup( MarkText, MarkGroup )
      local MarkID = UTILS.GetMarkID()
      trigger.action.markToGroup( MarkID, MarkText, self:GetVec3(), MarkGroup:GetID() )
      return MarkID
    end
    
    --- Remove a mark
    -- @param #COORDINATE self
    -- @param #number MarkID The ID of the mark to be removed.
    -- @usage
    --   local TargetCoord = TargetGroup:GetCoordinate()
    --   local MarkGroup = GROUP:FindByName( "AttackGroup" )
    --   local MarkID = TargetCoord:MarkToGroup( "This is a target for the attack group", AttackGroup )
    --   <<< logic >>>
    --   RemoveMark( MarkID ) -- The mark is now removed
    function COORDINATE:RemoveMark( MarkID )
      trigger.action.removeMark( MarkID )
    end
  
  end -- Markings
  

  --- Returns if a Coordinate has Line of Sight (LOS) with the ToCoordinate.
  -- @param #COORDINATE self
  -- @param #COORDINATE ToCoordinate
  -- @return #boolean true If the ToCoordinate has LOS with the Coordinate, otherwise false.
  function COORDINATE:IsLOS( ToCoordinate )

    -- Measurement of visibility should not be from the ground, so Adding a hypotethical 2 meters to each Coordinate.
    local FromVec3 = self:GetVec3()
    FromVec3.y = FromVec3.y + 2

    local ToVec3 = ToCoordinate:GetVec3()
    ToVec3.y = ToVec3.y + 2

    local IsLOS = land.isVisible( FromVec3, ToVec3 )

    return IsLOS
  end


  --- Return a BR string from a COORDINATE to the COORDINATE.
  -- @param #COORDINATE self
  -- @param #COORDINATE TargetCoordinate The target COORDINATE.
  -- @return #string The BR text.
  function COORDINATE:ToStringBR( FromCoordinate, Settings )
    local DirectionVec3 = FromCoordinate:GetDirectionVec3( self )
    local AngleRadians =  self:GetAngleRadians( DirectionVec3 )
    local Distance = self:Get2DDistance( FromCoordinate )
    return "BR, " .. self:GetBRText( AngleRadians, Distance, Settings )
  end

  --- Return a BRAA string from a COORDINATE to the COORDINATE.
  -- @param #COORDINATE self
  -- @param #COORDINATE TargetCoordinate The target COORDINATE.
  -- @return #string The BR text.
  function COORDINATE:ToStringBRA( FromCoordinate, Settings )
    local DirectionVec3 = FromCoordinate:GetDirectionVec3( self )
    local AngleRadians =  self:GetAngleRadians( DirectionVec3 )
    local Distance = FromCoordinate:Get2DDistance( self )
    local Altitude = self:GetAltitudeText()
    return "BRA, " .. self:GetBRAText( AngleRadians, Distance, Settings )
  end

  --- Return a BULLS string from a COORDINATE to the BULLS of the coalition.
  -- @param #COORDINATE self
  -- @param Dcs.DCSCoalition#coalition.side Coalition The coalition.
  -- @return #string The BR text.
  function COORDINATE:ToStringBULLS( Coalition, Settings )
    local TargetCoordinate = COORDINATE:NewFromVec3( coalition.getMainRefPoint( Coalition ) )
    local DirectionVec3 = self:GetDirectionVec3( TargetCoordinate )
    local AngleRadians =  self:GetAngleRadians( DirectionVec3 )
    local Distance = self:Get2DDistance( TargetCoordinate )
    local Altitude = self:GetAltitudeText()
    return "BULLS, " .. self:GetBRText( AngleRadians, Distance, Settings )
  end

  --- Return an aspect string from a COORDINATE to the Angle of the object.
  -- @param #COORDINATE self
  -- @param #COORDINATE TargetCoordinate The target COORDINATE.
  -- @return #string The Aspect string, which is Hot, Cold or Flanking.
  function COORDINATE:ToStringAspect( TargetCoordinate )
    local Heading = self.Heading
    local DirectionVec3 = self:GetDirectionVec3( TargetCoordinate )
    local Angle = self:GetAngleDegrees( DirectionVec3 )
    
    if Heading then
      local Aspect = Angle - Heading
      if Aspect > -135 and Aspect <= -45 then
        return "Flanking"
      end
      if Aspect > -45 and Aspect <= 45 then
        return "Hot"
      end
      if Aspect > 45 and Aspect <= 135 then
        return "Flanking"
      end
      if Aspect > 135 or Aspect <= -135 then
        return "Cold"
      end
    end
    return ""
  end

  --- Provides a Lat Lon string in Degree Minute Second format.
  -- @param #COORDINATE self
  -- @param Core.Settings#SETTINGS Settings (optional) Settings
  -- @return #string The LL DMS Text
  function COORDINATE:ToStringLLDMS( Settings ) 

    local LL_Accuracy = Settings and Settings.LL_Accuracy or _SETTINGS.LL_Accuracy
    local lat, lon = coord.LOtoLL( self:GetVec3() )
    return "LL DMS, " .. UTILS.tostringLL( lat, lon, LL_Accuracy, true )
  end

  --- Provides a Lat Lon string in Degree Decimal Minute format.
  -- @param #COORDINATE self
  -- @param Core.Settings#SETTINGS Settings (optional) Settings
  -- @return #string The LL DDM Text
  function COORDINATE:ToStringLLDDM( Settings )

    local LL_Accuracy = Settings and Settings.LL_Accuracy or _SETTINGS.LL_Accuracy
    local lat, lon = coord.LOtoLL( self:GetVec3() )
    return "LL DDM, " .. UTILS.tostringLL( lat, lon, LL_Accuracy, false )
  end

  --- Provides a MGRS string
  -- @param #COORDINATE self
  -- @param Core.Settings#SETTINGS Settings (optional) Settings
  -- @return #string The MGRS Text
  function COORDINATE:ToStringMGRS( Settings ) --R2.1 Fixes issue #424.

    local MGRS_Accuracy = Settings and Settings.MGRS_Accuracy or _SETTINGS.MGRS_Accuracy
    local lat, lon = coord.LOtoLL( self:GetVec3() )
    local MGRS = coord.LLtoMGRS( lat, lon )
    return "MGRS, " .. UTILS.tostringMGRS( MGRS, MGRS_Accuracy )
  end

  --- Provides a coordinate string of the point, based on a coordinate format system:
  --   * Uses default settings in COORDINATE.
  --   * Can be overridden if for a GROUP containing x clients, a menu was selected to override the default.
  -- @param #COORDINATE self
  -- @param Wrapper.Controllable#CONTROLLABLE Controllable
  -- @param Core.Settings#SETTINGS Settings
  -- @return #string The coordinate Text in the configured coordinate system.
  function COORDINATE:ToStringFromRP( ReferenceCoord, ReferenceName, Controllable, Settings ) -- R2.2
  
    self:E( { ReferenceCoord = ReferenceCoord, ReferenceName = ReferenceName } )

    local Settings = Settings or ( Controllable and _DATABASE:GetPlayerSettings( Controllable:GetPlayerName() ) ) or _SETTINGS
    
    local IsAir = Controllable and Controllable:IsAirPlane() or false

    if IsAir then
      local DirectionVec3 = ReferenceCoord:GetDirectionVec3( self )
      local AngleRadians =  self:GetAngleRadians( DirectionVec3 )
      local Distance = self:Get2DDistance( ReferenceCoord )
      return "Targets are the last seen " .. self:GetBRText( AngleRadians, Distance, Settings ) .. " from " .. ReferenceName
    else
      local DirectionVec3 = ReferenceCoord:GetDirectionVec3( self )
      local AngleRadians =  self:GetAngleRadians( DirectionVec3 )
      local Distance = self:Get2DDistance( ReferenceCoord )
      return "Target are located " .. self:GetBRText( AngleRadians, Distance, Settings ) .. " from " .. ReferenceName
    end
    
    return nil

  end

  --- Provides a coordinate string of the point, based on the A2G coordinate format system.
  -- @param #COORDINATE self
  -- @param Wrapper.Controllable#CONTROLLABLE Controllable
  -- @param Core.Settings#SETTINGS Settings
  -- @return #string The coordinate Text in the configured coordinate system.
  function COORDINATE:ToStringA2G( Controllable, Settings ) -- R2.2
  
    self:F( { Controllable = Controllable and Controllable:GetName() } )

    local Settings = Settings or ( Controllable and _DATABASE:GetPlayerSettings( Controllable:GetPlayerName() ) ) or _SETTINGS

    if Settings:IsA2G_BR()  then
      -- If no Controllable is given to calculate the BR from, then MGRS will be used!!!
      if Controllable then
        local Coordinate = Controllable:GetCoordinate()
        return Controllable and self:ToStringBR( Coordinate, Settings ) or self:ToStringMGRS( Settings )
      else
        return self:ToStringMGRS( Settings )
      end
    end
    if Settings:IsA2G_LL_DMS()  then
      return self:ToStringLLDMS( Settings )
    end
    if Settings:IsA2G_LL_DDM()  then
      return self:ToStringLLDDM( Settings )
    end
    if Settings:IsA2G_MGRS() then
      return self:ToStringMGRS( Settings )
    end

    return nil

  end


  --- Provides a coordinate string of the point, based on the A2A coordinate format system.
  -- @param #COORDINATE self
  -- @param Wrapper.Controllable#CONTROLLABLE Controllable
  -- @param Core.Settings#SETTINGS Settings
  -- @return #string The coordinate Text in the configured coordinate system.
  function COORDINATE:ToStringA2A( Controllable, Settings ) -- R2.2
  
    self:F( { Controllable = Controllable and Controllable:GetName() } )

    local Settings = Settings or ( Controllable and _DATABASE:GetPlayerSettings( Controllable:GetPlayerName() ) ) or _SETTINGS

    if Settings:IsA2A_BRAA()  then
      if Controllable then
        local Coordinate = Controllable:GetCoordinate()
        return self:ToStringBRA( Coordinate, Settings ) 
      else
        return self:ToStringMGRS( Settings )
      end
    end
    if Settings:IsA2A_BULLS() then
      local Coalition = Controllable:GetCoalition()
      return self:ToStringBULLS( Coalition, Settings )
    end
    if Settings:IsA2A_LL_DMS()  then
      return self:ToStringLLDMS( Settings )
    end
    if Settings:IsA2A_LL_DDM()  then
      return self:ToStringLLDDM( Settings )
    end
    if Settings:IsA2A_MGRS() then
      return self:ToStringMGRS( Settings )
    end

    return nil

  end

  --- Provides a coordinate string of the point, based on a coordinate format system:
  --   * Uses default settings in COORDINATE.
  --   * Can be overridden if for a GROUP containing x clients, a menu was selected to override the default.
  -- @param #COORDINATE self
  -- @param Wrapper.Controllable#CONTROLLABLE Controllable
  -- @param Core.Settings#SETTINGS Settings
  -- @param Tasking.Task#TASK Task The task for which coordinates need to be calculated.
  -- @return #string The coordinate Text in the configured coordinate system.
  function COORDINATE:ToString( Controllable, Settings, Task ) -- R2.2
  
    self:F( { Controllable = Controllable and Controllable:GetName() } )

    local Settings = Settings or ( Controllable and _DATABASE:GetPlayerSettings( Controllable:GetPlayerName() ) ) or _SETTINGS

    local ModeA2A = true
    
    if Task then
      if Task:IsInstanceOf( TASK_A2A ) then
        ModeA2A = true
      else
        if Task:IsInstanceOf( TASK_A2G ) then
          ModeA2A = false
        else
          if Task:IsInstanceOf( TASK_CARGO ) then
            ModeA2A = false
          end
        end
      end
    else
      local IsAir = Controllable and Controllable:IsAirPlane() or false
      if IsAir  then
        ModeA2A = true
      else
        ModeA2A = false
      end
    end
    

    if ModeA2A == true then
      return self:ToStringA2A( Controllable, Settings )
    else
      return self:ToStringA2G( Controllable, Settings )
    end
    
    return nil

  end

end

do -- POINT_VEC3

  --- The POINT_VEC3 class
  -- @type POINT_VEC3
  -- @field #number x The x coordinate in 3D space.
  -- @field #number y The y coordinate in 3D space.
  -- @field #number z The z coordiante in 3D space.
  -- @field Utilities.Utils#SMOKECOLOR SmokeColor
  -- @field Utilities.Utils#FLARECOLOR FlareColor
  -- @field #POINT_VEC3.RoutePointAltType RoutePointAltType
  -- @field #POINT_VEC3.RoutePointType RoutePointType
  -- @field #POINT_VEC3.RoutePointAction RoutePointAction
  -- @extends Core.Point#COORDINATE
  
  
  --- # POINT_VEC3 class, extends @{Point#COORDINATE}
  --
  -- POINT_VEC3 defines a 3D point in the simulator and with its methods, you can use or manipulate the point in 3D space.
  --
  -- **Important Note:** Most of the functions in this section were taken from MIST, and reworked to OO concepts.
  -- In order to keep the credibility of the the author,
  -- I want to emphasize that the formulas embedded in the MIST framework were created by Grimes or previous authors,
  -- who you can find on the Eagle Dynamics Forums.
  --
  --
  -- ## POINT_VEC3 constructor
  --
  -- A new POINT_VEC3 object can be created with:
  --
  --  * @{#POINT_VEC3.New}(): a 3D point.
  --  * @{#POINT_VEC3.NewFromVec3}(): a 3D point created from a @{DCSTypes#Vec3}.
  --
  --
  -- ## Manupulate the X, Y, Z coordinates of the POINT_VEC3
  --
  -- A POINT_VEC3 class works in 3D space. It contains internally an X, Y, Z coordinate.
  -- Methods exist to manupulate these coordinates.
  --
  -- The current X, Y, Z axis can be retrieved with the methods @{#POINT_VEC3.GetX}(), @{#POINT_VEC3.GetY}(), @{#POINT_VEC3.GetZ}() respectively.
  -- The methods @{#POINT_VEC3.SetX}(), @{#POINT_VEC3.SetY}(), @{#POINT_VEC3.SetZ}() change the respective axis with a new value.
  -- The current axis values can be changed by using the methods @{#POINT_VEC3.AddX}(), @{#POINT_VEC3.AddY}(), @{#POINT_VEC3.AddZ}()
  -- to add or substract a value from the current respective axis value.
  -- Note that the Set and Add methods return the current POINT_VEC3 object, so these manipulation methods can be chained... For example:
  --
  --      local Vec3 = PointVec3:AddX( 100 ):AddZ( 150 ):GetVec3()
  --
  --
  -- ## 3D calculation methods
  --
  -- Various calculation methods exist to use or manipulate 3D space. Find below a short description of each method:
  --
  --
  -- ## Point Randomization
  --
  -- Various methods exist to calculate random locations around a given 3D point.
  --
  --   * @{#POINT_VEC3.GetRandomPointVec3InRadius}(): Provides a random 3D point around the current 3D point, in the given inner to outer band.
  --
  --
  -- @field #POINT_VEC3
  POINT_VEC3 = {
    ClassName = "POINT_VEC3",
    Metric = true,
    RoutePointAltType = {
      BARO = "BARO",
    },
    RoutePointType = {
      TakeOffParking = "TakeOffParking",
      TurningPoint = "Turning Point",
    },
    RoutePointAction = {
      FromParkingArea = "From Parking Area",
      TurningPoint = "Turning Point",
    },
  }

  --- RoutePoint AltTypes
  -- @type POINT_VEC3.RoutePointAltType
  -- @field BARO "BARO"

  --- RoutePoint Types
  -- @type POINT_VEC3.RoutePointType
  -- @field TakeOffParking "TakeOffParking"
  -- @field TurningPoint "Turning Point"

  --- RoutePoint Actions
  -- @type POINT_VEC3.RoutePointAction
  -- @field FromParkingArea "From Parking Area"
  -- @field TurningPoint "Turning Point"

  -- Constructor.

  --- Create a new POINT_VEC3 object.
  -- @param #POINT_VEC3 self
  -- @param Dcs.DCSTypes#Distance x The x coordinate of the Vec3 point, pointing to the North.
  -- @param Dcs.DCSTypes#Distance y The y coordinate of the Vec3 point, pointing Upwards.
  -- @param Dcs.DCSTypes#Distance z The z coordinate of the Vec3 point, pointing to the Right.
  -- @return Core.Point#POINT_VEC3
  function POINT_VEC3:New( x, y, z )

    local self = BASE:Inherit( self, COORDINATE:New( x, y, z ) ) -- Core.Point#POINT_VEC3
    self:F2( self )
    
    return self
  end

  --- Create a new POINT_VEC3 object from Vec2 coordinates.
  -- @param #POINT_VEC3 self
  -- @param Dcs.DCSTypes#Vec2 Vec2 The Vec2 point.
  -- @param Dcs.DCSTypes#Distance LandHeightAdd (optional) Add a landheight.
  -- @return Core.Point#POINT_VEC3 self
  function POINT_VEC3:NewFromVec2( Vec2, LandHeightAdd )

    local self = BASE:Inherit( self, COORDINATE:NewFromVec2( Vec2, LandHeightAdd ) ) -- Core.Point#POINT_VEC3
    self:F2( self )

    return self
  end


  --- Create a new POINT_VEC3 object from  Vec3 coordinates.
  -- @param #POINT_VEC3 self
  -- @param Dcs.DCSTypes#Vec3 Vec3 The Vec3 point.
  -- @return Core.Point#POINT_VEC3 self
  function POINT_VEC3:NewFromVec3( Vec3 )

    local self = BASE:Inherit( self, COORDINATE:NewFromVec3( Vec3 ) ) -- Core.Point#POINT_VEC3
    self:F2( self )
  
    return self
  end



  --- Return the x coordinate of the POINT_VEC3.
  -- @param #POINT_VEC3 self
  -- @return #number The x coodinate.
  function POINT_VEC3:GetX()
    return self.x
  end

  --- Return the y coordinate of the POINT_VEC3.
  -- @param #POINT_VEC3 self
  -- @return #number The y coodinate.
  function POINT_VEC3:GetY()
    return self.y
  end

  --- Return the z coordinate of the POINT_VEC3.
  -- @param #POINT_VEC3 self
  -- @return #number The z coodinate.
  function POINT_VEC3:GetZ()
    return self.z
  end

  --- Set the x coordinate of the POINT_VEC3.
  -- @param #POINT_VEC3 self
  -- @param #number x The x coordinate.
  -- @return #POINT_VEC3
  function POINT_VEC3:SetX( x )
    self.x = x
    return self
  end

  --- Set the y coordinate of the POINT_VEC3.
  -- @param #POINT_VEC3 self
  -- @param #number y The y coordinate.
  -- @return #POINT_VEC3
  function POINT_VEC3:SetY( y )
    self.y = y
    return self
  end

  --- Set the z coordinate of the POINT_VEC3.
  -- @param #POINT_VEC3 self
  -- @param #number z The z coordinate.
  -- @return #POINT_VEC3
  function POINT_VEC3:SetZ( z )
    self.z = z
    return self
  end

  --- Add to the x coordinate of the POINT_VEC3.
  -- @param #POINT_VEC3 self
  -- @param #number x The x coordinate value to add to the current x coodinate.
  -- @return #POINT_VEC3
  function POINT_VEC3:AddX( x )
    self.x = self.x + x
    return self
  end

  --- Add to the y coordinate of the POINT_VEC3.
  -- @param #POINT_VEC3 self
  -- @param #number y The y coordinate value to add to the current y coodinate.
  -- @return #POINT_VEC3
  function POINT_VEC3:AddY( y )
    self.y = self.y + y
    return self
  end

  --- Add to the z coordinate of the POINT_VEC3.
  -- @param #POINT_VEC3 self
  -- @param #number z The z coordinate value to add to the current z coodinate.
  -- @return #POINT_VEC3
  function POINT_VEC3:AddZ( z )
    self.z = self.z +z
    return self
  end

  --- Return a random POINT_VEC3 within an Outer Radius and optionally NOT within an Inner Radius of the POINT_VEC3.
  -- @param #POINT_VEC3 self
  -- @param Dcs.DCSTypes#Distance OuterRadius
  -- @param Dcs.DCSTypes#Distance InnerRadius
  -- @return #POINT_VEC3
  function POINT_VEC3:GetRandomPointVec3InRadius( OuterRadius, InnerRadius )

    return POINT_VEC3:NewFromVec3( self:GetRandomVec3InRadius( OuterRadius, InnerRadius ) )
  end

end

do -- POINT_VEC2

  --- @type POINT_VEC2
  -- @field Dcs.DCSTypes#Distance x The x coordinate in meters.
  -- @field Dcs.DCSTypes#Distance y the y coordinate in meters.
  -- @extends Core.Point#COORDINATE
  
  --- # POINT_VEC2 class, extends @{Point#COORDINATE}
  --
  -- The @{Point#POINT_VEC2} class defines a 2D point in the simulator. The height coordinate (if needed) will be the land height + an optional added height specified.
  --
  -- ## POINT_VEC2 constructor
  --
  -- A new POINT_VEC2 instance can be created with:
  --
  --  * @{Point#POINT_VEC2.New}(): a 2D point, taking an additional height parameter.
  --  * @{Point#POINT_VEC2.NewFromVec2}(): a 2D point created from a @{DCSTypes#Vec2}.
  --
  -- ## Manupulate the X, Altitude, Y coordinates of the 2D point
  --
  -- A POINT_VEC2 class works in 2D space, with an altitude setting. It contains internally an X, Altitude, Y coordinate.
  -- Methods exist to manupulate these coordinates.
  --
  -- The current X, Altitude, Y axis can be retrieved with the methods @{#POINT_VEC2.GetX}(), @{#POINT_VEC2.GetAlt}(), @{#POINT_VEC2.GetY}() respectively.
  -- The methods @{#POINT_VEC2.SetX}(), @{#POINT_VEC2.SetAlt}(), @{#POINT_VEC2.SetY}() change the respective axis with a new value.
  -- The current Lat(itude), Alt(itude), Lon(gitude) values can also be retrieved with the methods @{#POINT_VEC2.GetLat}(), @{#POINT_VEC2.GetAlt}(), @{#POINT_VEC2.GetLon}() respectively.
  -- The current axis values can be changed by using the methods @{#POINT_VEC2.AddX}(), @{#POINT_VEC2.AddAlt}(), @{#POINT_VEC2.AddY}()
  -- to add or substract a value from the current respective axis value.
  -- Note that the Set and Add methods return the current POINT_VEC2 object, so these manipulation methods can be chained... For example:
  --
  --      local Vec2 = PointVec2:AddX( 100 ):AddY( 2000 ):GetVec2()
  --
  -- @field #POINT_VEC2
  POINT_VEC2 = {
    ClassName = "POINT_VEC2",
  }
  


  --- POINT_VEC2 constructor.
  -- @param #POINT_VEC2 self
  -- @param Dcs.DCSTypes#Distance x The x coordinate of the Vec3 point, pointing to the North.
  -- @param Dcs.DCSTypes#Distance y The y coordinate of the Vec3 point, pointing to the Right.
  -- @param Dcs.DCSTypes#Distance LandHeightAdd (optional) The default height if required to be evaluated will be the land height of the x, y coordinate. You can specify an extra height to be added to the land height.
  -- @return Core.Point#POINT_VEC2
  function POINT_VEC2:New( x, y, LandHeightAdd )

    local LandHeight = land.getHeight( { ["x"] = x, ["y"] = y } )

    LandHeightAdd = LandHeightAdd or 0
    LandHeight = LandHeight + LandHeightAdd

    local self = BASE:Inherit( self, COORDINATE:New( x, LandHeight, y ) ) -- Core.Point#POINT_VEC2
    self:F2( self )

    return self
  end

  --- Create a new POINT_VEC2 object from  Vec2 coordinates.
  -- @param #POINT_VEC2 self
  -- @param Dcs.DCSTypes#Vec2 Vec2 The Vec2 point.
  -- @return Core.Point#POINT_VEC2 self
  function POINT_VEC2:NewFromVec2( Vec2, LandHeightAdd )

    local LandHeight = land.getHeight( Vec2 )

    LandHeightAdd = LandHeightAdd or 0
    LandHeight = LandHeight + LandHeightAdd

    local self = BASE:Inherit( self, COORDINATE:NewFromVec2( Vec2, LandHeightAdd ) ) -- #POINT_VEC2
    self:F2( self )

    return self
  end

  --- Create a new POINT_VEC2 object from  Vec3 coordinates.
  -- @param #POINT_VEC2 self
  -- @param Dcs.DCSTypes#Vec3 Vec3 The Vec3 point.
  -- @return Core.Point#POINT_VEC2 self
  function POINT_VEC2:NewFromVec3( Vec3 )

    local self = BASE:Inherit( self, COORDINATE:NewFromVec3( Vec3 ) ) -- #POINT_VEC2
    self:F2( self )

    return self
  end

  --- Return the x coordinate of the POINT_VEC2.
  -- @param #POINT_VEC2 self
  -- @return #number The x coodinate.
  function POINT_VEC2:GetX()
    return self.x
  end

  --- Return the y coordinate of the POINT_VEC2.
  -- @param #POINT_VEC2 self
  -- @return #number The y coodinate.
  function POINT_VEC2:GetY()
    return self.z
  end

  --- Set the x coordinate of the POINT_VEC2.
  -- @param #POINT_VEC2 self
  -- @param #number x The x coordinate.
  -- @return #POINT_VEC2
  function POINT_VEC2:SetX( x )
    self.x = x
    return self
  end

  --- Set the y coordinate of the POINT_VEC2.
  -- @param #POINT_VEC2 self
  -- @param #number y The y coordinate.
  -- @return #POINT_VEC2
  function POINT_VEC2:SetY( y )
    self.z = y
    return self
  end

  --- Return Return the Lat(itude) coordinate of the POINT_VEC2 (ie: (parent)POINT_VEC3.x).
  -- @param #POINT_VEC2 self
  -- @return #number The x coodinate.
  function POINT_VEC2:GetLat()
    return self.x
  end

  --- Set the Lat(itude) coordinate of the POINT_VEC2 (ie: POINT_VEC3.x).
  -- @param #POINT_VEC2 self
  -- @param #number x The x coordinate.
  -- @return #POINT_VEC2
  function POINT_VEC2:SetLat( x )
    self.x = x
    return self
  end

  --- Return the Lon(gitude) coordinate of the POINT_VEC2 (ie: (parent)POINT_VEC3.z).
  -- @param #POINT_VEC2 self
  -- @return #number The y coodinate.
  function POINT_VEC2:GetLon()
    return self.z
  end

  --- Set the Lon(gitude) coordinate of the POINT_VEC2 (ie: POINT_VEC3.z).
  -- @param #POINT_VEC2 self
  -- @param #number y The y coordinate.
  -- @return #POINT_VEC2
  function POINT_VEC2:SetLon( z )
    self.z = z
    return self
  end

  --- Return the altitude (height) of the land at the POINT_VEC2.
  -- @param #POINT_VEC2 self
  -- @return #number The land altitude.
  function POINT_VEC2:GetAlt()
    return self.y ~= 0 or land.getHeight( { x = self.x, y = self.z } )
  end

  --- Set the altitude of the POINT_VEC2.
  -- @param #POINT_VEC2 self
  -- @param #number Altitude The land altitude. If nothing (nil) is given, then the current land altitude is set.
  -- @return #POINT_VEC2
  function POINT_VEC2:SetAlt( Altitude )
    self.y = Altitude or land.getHeight( { x = self.x, y = self.z } )
    return self
  end

  --- Add to the x coordinate of the POINT_VEC2.
  -- @param #POINT_VEC2 self
  -- @param #number x The x coordinate.
  -- @return #POINT_VEC2
  function POINT_VEC2:AddX( x )
    self.x = self.x + x
    return self
  end

  --- Add to the y coordinate of the POINT_VEC2.
  -- @param #POINT_VEC2 self
  -- @param #number y The y coordinate.
  -- @return #POINT_VEC2
  function POINT_VEC2:AddY( y )
    self.z = self.z + y
    return self
  end

  --- Add to the current land height an altitude.
  -- @param #POINT_VEC2 self
  -- @param #number Altitude The Altitude to add. If nothing (nil) is given, then the current land altitude is set.
  -- @return #POINT_VEC2
  function POINT_VEC2:AddAlt( Altitude )
    self.y = land.getHeight( { x = self.x, y = self.z } ) + Altitude or 0
    return self
  end


  --- Return a random POINT_VEC2 within an Outer Radius and optionally NOT within an Inner Radius of the POINT_VEC2.
  -- @param #POINT_VEC2 self
  -- @param Dcs.DCSTypes#Distance OuterRadius
  -- @param Dcs.DCSTypes#Distance InnerRadius
  -- @return #POINT_VEC2
  function POINT_VEC2:GetRandomPointVec2InRadius( OuterRadius, InnerRadius )
    self:F2( { OuterRadius, InnerRadius } )

    return POINT_VEC2:NewFromVec2( self:GetRandomVec2InRadius( OuterRadius, InnerRadius ) )
  end

  -- TODO: Check this to replace
  --- Calculate the distance from a reference @{#POINT_VEC2}.
  -- @param #POINT_VEC2 self
  -- @param #POINT_VEC2 PointVec2Reference The reference @{#POINT_VEC2}.
  -- @return Dcs.DCSTypes#Distance The distance from the reference @{#POINT_VEC2} in meters.
  function POINT_VEC2:DistanceFromPointVec2( PointVec2Reference )
    self:F2( PointVec2Reference )

    local Distance = ( ( PointVec2Reference.x - self.x ) ^ 2 + ( PointVec2Reference.z - self.z ) ^2 ) ^ 0.5

    self:T2( Distance )
    return Distance
  end

end


