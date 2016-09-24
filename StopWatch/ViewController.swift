//
//  ViewController.swift
//  StopWatch
//
//  Created by Zain on 4/28/16.
//  Copyright © 2016 Zain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: NSTimer?
    var startTime: NSDate?
    var currentTime: NSDate?
    var stopTime: NSDate?
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startButton.layer.borderWidth = 1;
        startButton.layer.borderColor = UIColor.blackColor().CGColor;
        
        stopButton.layer.borderWidth = 1;
        stopButton.layer.borderColor = UIColor.blackColor().CGColor;
        
        resetButton.layer.borderWidth = 1;
        resetButton.layer.borderColor = UIColor.blackColor().CGColor;
        
        timeLabel.text = dateStringFromTimeInverval(0);
    }
    
    func start() {
        if (timer == nil) {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateTimer:"), userInfo: nil, repeats: true);
            
            if (stopTime != nil) {
                var duration = stopTime?.timeIntervalSinceDate(startTime!);
                startTime = NSDate(timeInterval: -duration!, sinceDate: NSDate())
            } else {
                startTime = NSDate();
            }
            
        }
        
    }
    
    func updateTimer(myTimer: NSTimer) {
        currentTime = NSDate();
        if startTime != nil {
            var duration = currentTime?.timeIntervalSinceDate(startTime!);
            
            
            timeLabel.text = dateStringFromTimeInverval(duration!);
            
        }
    }
    
    func dateStringFromTimeInverval(timeInterval: NSTimeInterval) -> String{
        var dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "HH:mm:ss.SS"
        
        dateFormatter.timeZone = NSTimeZone(name: "UTC");
        
        var date = NSDate(timeIntervalSince1970: timeInterval);
        return dateFormatter.stringFromDate(date);
    }
    
    func stop() {
        stopTime = NSDate();
        
        // Stops timer
        timer?.invalidate();
        timer = nil;
        
        //currentTime = stopTime;
    }
    
    func reset() {
        // Stops timer
        timer?.invalidate();
        timer = nil;
        
        startTime = nil;
        stopTime = nil;
        currentTime = nil;
        
        timeLabel.text = dateStringFromTimeInverval(0);
    }
    
    @IBAction func startButtonPressed(sender: AnyObject) {
        print("Start Button Pressed");
        start();
    }

    
    @IBAction func stopButtonPressed(sender: AnyObject) {
         print("Stop Button Pressed");
        stop();
    }
    @IBAction func resetButtonPressed(sender: AnyObject) {
        print("Reset Button Pressed");
        reset();
    }
    
}

