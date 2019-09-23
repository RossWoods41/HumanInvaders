package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;
import com.stencyl.graphics.ScaleMode;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Config;
import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.motion.*;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class SceneEvents_9 extends SceneScript
{
	public var _check:Bool;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("check", "_check");
		_check = false;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		Engine.engine.setGameAttribute("EnenmyDeath", 26);
		Engine.engine.setGameAttribute("Time", 25);
		
		/* =========================== Keyboard =========================== */
		addKeyStateListener("pause", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && pressed)
			{
				if((_check == false))
				{
					engine.pause();
					_check = true;
				}
				else
				{
					engine.unpause();
					_check = false;
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.setFont(getFont(66));
				g.drawString("" + "Time:", 450, 420);
				g.drawString("" + (Engine.engine.getGameAttribute("Time") : Float), 560, 420);
			}
		});
		
		/* ======================== Actor of Type ========================= */
		addWhenTypeGroupKilledListener(getActorType(7), function(eventActor:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				Engine.engine.setGameAttribute("EnenmyDeath", ((Engine.engine.getGameAttribute("EnenmyDeath") : Float) - 1));
			}
		});
		
		/* ======================== Actor of Type ========================= */
		addWhenTypeGroupKilledListener(getActorType(3), function(eventActor:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				Engine.engine.setGameAttribute("EnenmyDeath", ((Engine.engine.getGameAttribute("EnenmyDeath") : Float) - 1));
			}
		});
		
		/* ======================== Actor of Type ========================= */
		addWhenTypeGroupKilledListener(getActorType(5), function(eventActor:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				Engine.engine.setGameAttribute("EnenmyDeath", ((Engine.engine.getGameAttribute("EnenmyDeath") : Float) - 1));
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("EnenmyDeath") : Float) == 0))
				{
					switchScene(GameModel.get().scenes.get(7).getID(), null, createCrossfadeTransition(0.25));
				}
				if(((Engine.engine.getGameAttribute("Time") : Float) == 0))
				{
					switchScene(GameModel.get().scenes.get(8).getID(), null, createCrossfadeTransition(0.25));
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addWhenKilledListener(getActor(1), function(list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				switchScene(GameModel.get().scenes.get(8).getID(), null, createCrossfadeTransition(0.25));
			}
		});
		
		/* ======================= Every N seconds ======================== */
		runPeriodically(1000 * 1, function(timeTask:TimedTask):Void
		{
			if(wrapper.enabled)
			{
				Engine.engine.setGameAttribute("Time", ((Engine.engine.getGameAttribute("Time") : Float) - 1));
			}
		}, null);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}