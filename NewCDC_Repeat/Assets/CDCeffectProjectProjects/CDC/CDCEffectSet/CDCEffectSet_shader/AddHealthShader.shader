// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:4795,x:33051,y:32701,varname:node_4795,prsc:2|emission-2393-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:32235,y:32601,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3495cef4e15dae64da8943dcd4ae867f,ntxv:3,isnm:False|UVIN-214-OUT;n:type:ShaderForge.SFN_Multiply,id:2393,x:32820,y:32781,varname:node_2393,prsc:2|A-7441-OUT,B-2053-RGB,C-555-RGB,D-9248-OUT,E-648-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:32235,y:32772,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Vector1,id:9248,x:32235,y:33106,varname:node_9248,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:648,x:32653,y:32979,varname:node_648,prsc:2|A-6074-A,B-555-A;n:type:ShaderForge.SFN_Time,id:1081,x:31656,y:32670,varname:node_1081,prsc:2;n:type:ShaderForge.SFN_Append,id:9521,x:31656,y:32896,varname:node_9521,prsc:2|A-7089-OUT,B-8413-OUT;n:type:ShaderForge.SFN_Multiply,id:9203,x:31821,y:32802,varname:node_9203,prsc:2|A-1081-T,B-9521-OUT;n:type:ShaderForge.SFN_Add,id:214,x:31993,y:32676,varname:node_214,prsc:2|A-834-UVOUT,B-9203-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7089,x:31395,y:32868,ptovrint:False,ptlb:Xspeed,ptin:_Xspeed,varname:node_7089,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.2;n:type:ShaderForge.SFN_ValueProperty,id:8413,x:31421,y:33012,ptovrint:False,ptlb:Yspeed,ptin:_Yspeed,varname:_Xspeed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_TexCoord,id:834,x:31773,y:32487,varname:node_834,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:1590,x:32235,y:32219,ptovrint:False,ptlb:MaskFram,ptin:_MaskFram,varname:node_1590,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2161,x:32235,y:32407,ptovrint:False,ptlb:MaskTexture,ptin:_MaskTexture,varname:node_2161,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:168148332780a3a49a85d09989cecb06,ntxv:0,isnm:False|UVIN-214-OUT;n:type:ShaderForge.SFN_Multiply,id:7441,x:32573,y:32566,varname:node_7441,prsc:2|A-2161-RGB,B-6074-RGB;n:type:ShaderForge.SFN_Tex2d,id:555,x:32235,y:32940,ptovrint:False,ptlb:color,ptin:_color,varname:node_555,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6aef48bbee6e9464b894f3fdd04bf536,ntxv:0,isnm:False|UVIN-214-OUT;proporder:6074-7089-8413-2161-555;pass:END;sub:END;*/

Shader "Shader Forge/AddHealthShader" {
    Properties {
        _MainTex ("MainTex", 2D) = "bump" {}
        _Xspeed ("Xspeed", Float ) = 0.2
        _Yspeed ("Yspeed", Float ) = 0
        _MaskTexture ("MaskTexture", 2D) = "white" {}
        _color ("color", 2D) = "white" {}

         _blendTex ("Texture to blend", 2D) = "black" {}
    }
    SubShader {
       
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
              
                "LightMode"="ForwardBase"
            }
            Blend One One
           
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
           // #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
           // #pragma multi_compile_fwdbase
           // #pragma multi_compile_fog
           // #pragma only_renderers d3d9 d3d11 glcore gles 
          //  #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Xspeed;
            uniform float _Yspeed;
            uniform sampler2D _MaskTexture; uniform float4 _MaskTexture_ST;
            uniform sampler2D _color; uniform float4 _color_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_1081 = _Time + _TimeEditor;
                float2 node_214 = (i.uv0+(node_1081.g*float2(_Xspeed,_Yspeed)));
                float4 _MaskTexture_var = tex2D(_MaskTexture,TRANSFORM_TEX(node_214, _MaskTexture));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_214, _MainTex));
                float4 _color_var = tex2D(_color,TRANSFORM_TEX(node_214, _color));
                float3 emissive = ((_MaskTexture_var.rgb*_MainTex_var.rgb)*i.vertexColor.rgb*_color_var.rgb*1*(_MainTex_var.a*_color_var.a));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG_COLOR(i.fogCoord, finalRGBA, fixed4(0.5,0.5,0.5,1));
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
