local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v20,v21) local v22={};for v31=1, #v20 do v6(v22,v0(v4(v1(v2(v20,v31,v31 + 1 )),v1(v2(v21,1 + (v31% #v21) ,1 + (v31% #v21) + 1 )))%256 ));end return v5(v22);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=game:GetService(v7("\17\216\36\246\249\49\219\35\198\249","\156\67\173\74\165"));local v10=game:GetService(v7("\1\164\76\4\149\40\86\33\163\122\19\174\48\79\55\178","\38\84\215\41\118\220\70"));local v11=game:GetService(v7("\103\25\48\25\237\64\23\33\23","\158\48\118\66\114"));local v12=game:GetService(v7("\153\33\0\58\122\166\250\191\33\20\5\103\170\233\170\35\21","\155\203\68\112\86\19\197"));local v13=v11.CurrentCamera;local v14=v8.LocalPlayer;local v15=true;local v16=true;local v17={};local function v18() local v23=nil;local v24=math.huge;for v32,v33 in pairs(v8:GetPlayers()) do if ((v33~=v14) and v33.Character and v33.Character:FindFirstChild(v7("\110\200\59\253\78\119\236\252\116\210\57\232\112\121\247\236","\152\38\189\86\156\32\24\133"))) then local v39=(v33.Character.HumanoidRootPart.Position-v14.Character.HumanoidRootPart.Position).Magnitude;if (v39<v24) then local v42=1426 -(562 + 864) ;while true do if (v42==(0 + 0)) then v24=v39;v23=v33;break;end end end end end if (v23 and v23.Character and v23.Character:FindFirstChild(v7("\212\82\166\66","\38\156\55\199"))) then return v23.Character.Head;end return nil;end v10.InputBegan:Connect(function(v25) if ((v25.UserInputType==Enum.UserInputType.MouseButton1) and v15) then local v34=v18();if v34 then local v40=0 + 0 ;local v41;while true do if (v40==(519 -(114 + 404))) then v12.Remotes.Attack:FireServer(v34);break;end if (v40==(488 -(106 + 382))) then v41=v34.Position;v13.CFrame=CFrame.new(v13.CFrame.Position,v41);v40=1;end end end end end);local function v19(v26) if (v26~=v14) then local v35=411 -(306 + 105) ;local v36;while true do if (v35==1) then v36.Color=Color3.fromRGB(0 -0 ,255,0);v36.Transparency=1;v35=429 -(166 + 261) ;end if (v35==(507 -(289 + 218))) then local v45=1344 -(1213 + 131) ;while true do if (v45==(1 + 0)) then v35=1;break;end if (v45==0) then v36=Drawing.new(v7("\139\116\110\43\31\113","\35\200\29\28\72\115\20\154"));v36.Thickness=2 + 0 ;v45=3 -2 ;end end end if (v35==3) then v17[v26.Name]=v36;v9.RenderStepped:Connect(function() if (v16 and v26.Character and v26.Character:FindFirstChild(v7("\49\170\220\222\131\35\61\29\141\222\208\153\28\53\11\171","\84\121\223\177\191\237\76"))) then local v52=v26.Character.HumanoidRootPart;if v52 then local v55=0 -0 ;local v56;local v57;while true do if ((859 -(814 + 45))==v55) then v56,v57=v13:WorldToViewportPoint(v52.Position);if v57 then local v59=0 -0 ;local v60;while true do if (v59==(0 + 0)) then v60=0;while true do if (v60==0) then v36.Position=Vector2.new(v56.X,v56.Y);v36.Radius=18 + 32 ;v60=886 -(261 + 624) ;end if (v60==(1 -0)) then v36.Visible=true;break;end end break;end end else v36.Visible=false;end break;end end else v36.Visible=false;end else v36.Visible=false;end end);break;end if (v35==(1082 -(1020 + 60))) then v36.Filled=false;v36.Visible=true;v35=3;end end end end for v27,v28 in pairs(v8:GetPlayers()) do v19(v28);end v8.PlayerAdded:Connect(function(v29) v19(v29);end);v8.PlayerRemoving:Connect(function(v30) if v17[v30.Name] then local v37=0;local v38;while true do if (v37==0) then v38=1423 -(630 + 793) ;while true do if ((0 -0)==v38) then v17[v30.Name]:Remove();v17[v30.Name]=nil;break;end end break;end end end end);print(v7("\136\95\197\165\52\68\112\224\178\91\137\161\52\84\112\228\136\102\137\147\57\66\57\209\175\22\207\175\40\16\2\200\173\87\197\179\122\92\63\192\191\83\205\224\41\69\51\194\190\69\218\166\47\92\60\216\245","\161\219\54\169\192\90\48\80"));
