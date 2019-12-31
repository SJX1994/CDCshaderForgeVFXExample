// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:Mobile/Diffuse,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:True,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:False,qofs:0,qpre:2,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33128,y:32726,varname:node_4013,prsc:2|diff-919-OUT,emission-919-OUT,alpha-7946-OUT;n:type:ShaderForge.SFN_Tex2d,id:1213,x:32109,y:32771,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_1213,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:53c52bf98501c3442b9a2173e320738a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:4845,x:32394,y:32731,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_4845,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4852941,c2:0.4852941,c3:0.4852941,c4:1;n:type:ShaderForge.SFN_Multiply,id:1799,x:32613,y:32568,varname:node_1799,prsc:2|A-1213-RGB,B-4845-RGB,C-4845-A,D-5038-RGB;n:type:ShaderForge.SFN_Tex2d,id:6607,x:32639,y:32782,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_6607,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6a985dfcd1d3ca94e9753748ed65c697,ntxv:2,isnm:False|UVIN-1690-UVOUT,MIP-4845-A;n:type:ShaderForge.SFN_Multiply,id:919,x:32919,y:32671,varname:node_919,prsc:2|A-1799-OUT,B-6607-RGB;n:type:ShaderForge.SFN_Panner,id:1690,x:32515,y:33037,varname:node_1690,prsc:2,spu:1,spv:1|UVIN-1383-OUT,DIST-2676-OUT;n:type:ShaderForge.SFN_TexCoord,id:7156,x:31731,y:32989,varname:node_7156,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:8919,x:32094,y:33184,varname:node_8919,prsc:2,v1:-5;n:type:ShaderForge.SFN_Multiply,id:1383,x:32313,y:33040,varname:node_1383,prsc:2|A-5670-OUT,B-8919-OUT;n:type:ShaderForge.SFN_Time,id:6508,x:32094,y:33260,varname:node_6508,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2676,x:32336,y:33299,varname:node_2676,prsc:2|A-6508-T,B-1569-OUT;n:type:ShaderForge.SFN_RemapRange,id:9807,x:31901,y:32989,varname:node_9807,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-7156-UVOUT;n:type:ShaderForge.SFN_Length,id:5670,x:32094,y:33040,varname:node_5670,prsc:2|IN-9807-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1569,x:32094,y:33439,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:node_1569,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_VertexColor,id:5038,x:32059,y:32570,varname:node_5038,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7946,x:32394,y:32905,varname:node_7946,prsc:2|A-1213-A,B-5038-A;proporder:1569-4845-1213-6607;pass:END;sub:END;*/

Shader "Shader Forge/SrockWave" {
    Properties {
        _Speed ("Speed", Float ) = 0.5
        _Color ("Color", Color) = (0.4852941,0.4852941,0.4852941,1)
        _alpha ("alpha", 2D) = "white" {}
        _Texture ("Texture", 2D) = "black" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="Transparent"
        }
        LOD 300
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            ZWrite Off
            
            AlphaToMask On
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _alpha; uniform float4 _alpha_ST;
            uniform float4 _Color;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _Speed;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _alpha_var = tex2D(_alpha,TRANSFORM_TEX(i.uv0, _alpha));
                float4 node_6508 = _Time + _TimeEditor;
                float2 node_1690 = ((length((i.uv0*2.0+-1.0))*(-5.0))+(node_6508.g*_Speed)*float2(1,1));
                float4 _Texture_var = tex2Dlod(_Texture,float4(TRANSFORM_TEX(node_1690, _Texture),0.0,_Color.a));
                float3 node_919 = ((_alpha_var.rgb*_Color.rgb*_Color.a*i.vertexColor.rgb)*_Texture_var.rgb);
                float3 diffuseColor = node_919;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = node_919;
/// Final Color:
                float3 finalColor = diffuse + emissive;
                fixed4 finalRGBA = fixed4(finalColor,(_alpha_var.a*i.vertexColor.a));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _alpha; uniform float4 _alpha_ST;
            uniform float4 _Color;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _Speed;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _alpha_var = tex2D(_alpha,TRANSFORM_TEX(i.uv0, _alpha));
                float4 node_6508 = _Time + _TimeEditor;
                float2 node_1690 = ((length((i.uv0*2.0+-1.0))*(-5.0))+(node_6508.g*_Speed)*float2(1,1));
                float4 _Texture_var = tex2Dlod(_Texture,float4(TRANSFORM_TEX(node_1690, _Texture),0.0,_Color.a));
                float3 node_919 = ((_alpha_var.rgb*_Color.rgb*_Color.a*i.vertexColor.rgb)*_Texture_var.rgb);
                float3 diffuseColor = node_919;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * (_alpha_var.a*i.vertexColor.a),0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Mobile/Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
