---
title: keep-alive
tag: vue
---



在平常开发中，有部分组件没有必要多次初始化，这时，我们需要将组件进行持久化，**使组件的状态维持不变**，在下一次展示时，也不会进行重新初始化组件。

`keepalive` 是 `Vue` 内置的一个组件，可以**使被包含的组件保留状态，或避免重新渲染** 。也就是所谓的**组件缓存**

`<keep-alive>`是`vue`的内置组件，能在组件切换过程中将状态保留在内存中，防止重复渲染DOM。



具体来说，keep-alive 会缓存它包裹的组件的实例，在下一次渲染时直接使用缓存的实例，这样就避免了对应组件重新创建、挂载和销毁的过程，减少了不必要的性能开销。

举个例子：假设我们有两个组件 A 和 B，在同一个页面下交替显示。当我们从组件 A 切换到组件 B 的时候，组件 A 就会被销毁，组件 B 被创建并挂载。但是如果我们给这两个组件都加上了 <keep-alive> 标签：

```html
<keep-alive>
  <A></A>
</keep-alive>

<keep-alive>
  <B></B>
</keep-alive>
```

那么在切换组件的时候，组件 A 不会被销毁，而是被缓存起来；组件 B 也不是第一次创建，而是直接使用之前缓存的实例，实现了组件状态的保留和跨组件的复用。

需要注意的是，keep-alive 只能包裹有一个直接子元素的组件，因此在使用的时候需要注意其使用方式。



## `keep-alive`的声明周期执行

```html
初始进入和离开 created ---> mounted ---> activated --> deactivated
后续进入和离开 activated --> deactivated
```



与router-view结合使用

```vue
<keep-alive>
    <router-view>
        <!-- 所有路径匹配到的视图组件都会被缓存！ -->
    </router-view>
</keep-alive>
```

### **如果只想要`router-view`里面的某个组件被缓存，怎么办？**

- 使用 `include`/`exclude`
- 使用 `meta` 属性

1、用 `include` (`exclude`例子类似)

> 缺点：需要知道组件的 name，项目复杂的时候不是很好的选择

##### 动态判断

```stata
<keep-alive :include="includedComponents">
  <router-view></router-view>
</keep-alive>
```

`includedComponents`动态设置即可

2、使用 meta 属性

> 优点：不需要例举出需要被缓存组件名称 使用$route.meta的keepAlive属性：

```html
html复制代码<keep-alive>
    <router-view v-if="$route.meta.keepAlive"></router-view>
</keep-alive>
<router-view v-if="!$route.meta.keepAlive"></router-view>
```

需要在`router`中设置router的元信息meta：

```js
js复制代码//...router.js
export default new Router({
  routes: [
    {
      path: '/',
      name: 'Hello',
      component: Hello,
      meta: {
        keepAlive: false // 不需要缓存
      }
    },
    {
      path: '/page1',
      name: 'Page1',
      component: Page1,
      meta: {
        keepAlive: true // 需要被缓存
      }
    }
  ]
})
```



**keep-alive生命周期钩子函数：activated、deactivated**

使用`<keep-alive>`会将数据保留在内存中，如果要在每次进入页面的时候获取最新的数据，需要在`activated`阶段获取数据，承担原来`created`钩子中获取数据的任务。



## key属性

在 Vue 中，使用 `<keep-alive>` 可以实现对组件的缓存，但有时候我们需要动态地创建或销毁缓存的组件，这时就需要使用 `key` 属性。

当我们为缓存的动态组件设置了 `key` 属性之后，在组件切换时，Vue 会根据 `key` 值来匹配缓存的组件：

- 如果当前组件和缓存的组件都有同样的 `key` 值，那么会直接使用缓存的组件。
- 如果当前组件没有 `key` 值，那么每次都会创建新的组件实例。
- 如果当前组件有 `key` 值，但是和缓存的组件的 `key` 值不一样，那么会销毁之前的缓存组件，并重新创建新的组件实例并缓存起来。

举一个简单的例子，在缓存两个不同的组件的情况下，可以使用 key 来区分它们：

```
<template>
  <div>
    <keep-alive>
      <component :is="myComponent" :key="myComponent"></component>
    </keep-alive>
    
    <button @click="changeComponent">Change Component</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      myComponent: 'A'
    }
  },
  methods: {
    changeComponent() {
      this.myComponent = this.myComponent === 'A' ? 'B' : 'A'
    }
  }
}
</script>
```

在这个例子中，我们用一个简单的按钮来切换两个不同的动态组件。`<keep-alive>` 中的 `<component>` 标签会根据 `myComponent` 的不同值来渲染不同的组件。同时，它们都带有相同的 `key` 值，在组件切换时可以直接从缓存中读取、恢复状态。

当然，如果我们更改了组件的 `key` 值，那么对应的缓存也会失效，需要重新创建和挂载组件。所以在使用 `key` 属性时，需要谨慎处理，避免出现其他问题。

```vue
:key = "$route.fullpath"
```

## 注意

### 加上keep-alive就不会执行destroy()

不执行destroy()， 如果想在切换组件时实现相同效果，可以在deactivated中实现

### 当使用 `keep-alive` 缓存相同路径但带有不同参数的组件时，`watch` 监听器会在组件从缓存中重新激活时同时触发。

通过为每个缓存的组件设置唯一的 `key`，可以确保即使组件的路径和参数相同，它们仍然是独立的实例，不会相互影响或触发多次事件。
