package org.flexlite.domUI.events
{
	import flash.events.Event;
	
	import org.flexlite.domUI.components.IItemRenderer;
	import org.flexlite.domUI.components.supportClasses.TreeItemRenderer;
	
	
	/**
	 * Tree事件
	 * @author DOM
	 */
	public class TreeEvent extends Event
	{
		/**
		 * 节点关闭
		 */		
		public static const ITEM_CLOSE:String = "itemClose";
		/**
		 * 节点打开
		 */		
		public static const ITEM_OPEN:String = "itemOpen";
		/**
		 * 子节点打开或关闭前一刻分派。可以调用preventDefault()方法阻止节点的状态改变。
		 */		
		public static const ITEM_OPENING:String = "itemOpening";
		
		public function TreeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=true,
								  itemIndex:int = -1,item:Object = null,itemRenderer:TreeItemRenderer = null)
		{
			super(type, bubbles, cancelable);
			this.item = item;
			this.itemRenderer = itemRenderer;
			this.itemIndex = itemIndex;
		}
		
		/**
		 * 触发鼠标事件的项呈示器数据源项。
		 */
		public var item:Object;
		
		/**
		 * 触发鼠标事件的项呈示器。 
		 */		
		public var itemRenderer:TreeItemRenderer;
		/**
		 * 触发鼠标事件的项索引
		 */		
		public var itemIndex:int;
		/**
		 * 当事件类型为ITEM_OPENING时，true表示即将打开节点，反之关闭。
		 */		
		public var opening:Boolean;
		/**
		 * @inheritDoc
		 */
		override public function clone():Event
		{
			var evt:TreeEvent = new TreeEvent(type, bubbles, cancelable,
				itemIndex,item, itemRenderer);
			evt.opening = opening;
			return evt;
		}
	}
}