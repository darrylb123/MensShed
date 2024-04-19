(Exported by FreeCAD)
(Post Processor: linuxcnc_post)
(Output Time:2021-11-29 11:23:19.201320)
(begin preamble)
G17 G54 G40 G49 G80 G90
G21
(begin operation: Fixture)
(machine: not set, mm/min)
G54 
(finish operation: Fixture)
(begin operation: 5mm Endmill001)
(machine: not set, mm/min)
(5mm Endmill001) 
M5
M6 T1 
G43 H1 
M3 S5000 
(finish operation: 5mm Endmill001)
(begin operation: Profile)
(machine: not set, mm/min)
(Profile) 
(Compensated Tool Path. Diameter: 5.0) 
G0 Z16.000 
G0 X37.123 Y37.123 
G0 Z14.000 
G1 X37.123 Y37.123 Z6.000 F60.000 
G2 X3.153 Y-52.405 Z6.000 I-37.123 J-37.123 F60.000 
G2 X-52.405 Y-3.153 Z6.000 I-3.153 J52.405 F60.000 
G2 X-3.153 Y52.405 Z6.000 I52.405 J3.153 F60.000 
G2 X37.123 Y37.123 Z6.000 I3.153 J-52.405 F60.000 
G1 X37.123 Y37.123 Z1.000 F60.000 
G2 X3.153 Y-52.405 Z1.000 I-37.123 J-37.123 F60.000 
G2 X-52.405 Y-3.153 Z1.000 I-3.153 J52.405 F60.000 
G2 X-3.153 Y52.405 Z1.000 I52.405 J3.153 F60.000 
G2 X37.123 Y37.123 Z1.000 I3.153 J-52.405 F60.000 
G1 X37.123 Y37.123 Z-1.000 F60.000 
G2 X3.153 Y-52.405 Z-1.000 I-37.123 J-37.123 F60.000 
G2 X-52.405 Y-3.153 Z-1.000 I-3.153 J52.405 F60.000 
G2 X-3.153 Y52.405 Z-1.000 I52.405 J3.153 F60.000 
G2 X37.123 Y37.123 Z-1.000 I3.153 J-52.405 F60.000 
G0 Z16.000 
G0 Z16.000 
(finish operation: Profile)
(begin postamble)
M05
G17 G54 G90 G80 G40
M2
