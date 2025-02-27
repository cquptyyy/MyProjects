#include "EventLoopThread.h"
#include "EventLoop.h"


//传入线程函数初始化一个线程，获取初始化loop的对象
EventLoopThread::EventLoopThread(const ThreadInitCallback& cb,const std::string&name)
  :callback_(cb)
  ,thread_(std::bind(EventLoopThread::threadFunc,this),name)
  ,loop_(nullptr)
  ,exiting_(false)
  ,mutex_()
  ,cond_()
  {}


//将事件循环停止，等待线程结束
EventLoopThread::~EventLoopThread(){
  exiting_=true;
  if(loop_!=nullptr){
    loop_->quit();
    thread_.join();
  }
}


//启动线程，开始事件循环，获取loop指针
EventLoop* EventLoopThread::startLoop(){
  thread_.start();
  EventLoop* loop=nullptr;
  {
    std::unique_lock<std::mutex> lock(mutex_);
    while(loop_==nullptr){
      cond_.wait(lock);
    }
    loop=loop_;
  }
  return loop;
}


//线程执行的线程函数
void EventLoopThread::threadFunc(){
  EventLoop loop;
  if(callback_!=nullptr){
    callback_(&loop);
  }
  {
    std::unique_lock<std::mutex> lock(mutex_);
    loop_=&loop;
    cond_.notify_one();
  }
  loop.loop();
  std::unique_lock<std::mutex> lock(mutex_);
  loop_=nullptr;
}
