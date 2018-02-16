#import "AppMapViewDelegate.h"

@import Wrld;

@implementation AppMapViewDelegate
{
    WRLDMapView* _mapView;
}
    
- (void)mapViewRegionWillChange:(WRLDMapView *)mapView
{
    NSLog(@"AppMapViewDelegate - map view region will change.");
}
    
- (void)mapViewRegionDidChange:(WRLDMapView *)mapView
{
    NSLog(@"AppMapViewDelegate - map view region did change.");
}

- (void)mapViewDidFinishLoadingInitialMap:(WRLDMapView *)mapView
{
    _mapView = mapView;

    //Go to floor button
//    _goToFloorButton = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    [_goToFloorButton addTarget:self
//                    action:@selector(goToFloor)
//          forControlEvents:UIControlEventTouchUpInside];
//
//    [_goToFloorButton setTitle:@"Go to floor" forState:UIControlStateNormal];
//    _goToFloorButton.frame = CGRectMake(3.0, 3.0, 150.0, 50.0);
//    _goToFloorButton.backgroundColor = [UIColor lightGrayColor];
//
//    [_mapView addSubview:_goToFloorButton];

    //Add highlights button
    _highlightEntitiesButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [_highlightEntitiesButton addTarget:self
                         action:@selector(setEntityHighlights)
               forControlEvents:UIControlEventTouchUpInside];

    [_highlightEntitiesButton setTitle:@"Highlight entities" forState:UIControlStateNormal];
    _highlightEntitiesButton.frame = CGRectMake(3.0, 56.0, 150.0, 50.0);
    _highlightEntitiesButton.backgroundColor = [UIColor lightGrayColor];

    [_mapView addSubview:_highlightEntitiesButton];

    //Clear highlights button
    _clearHighlightsButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [_clearHighlightsButton addTarget:self
                         action:@selector(clearEntityHighlights)
               forControlEvents:UIControlEventTouchUpInside];

    [_clearHighlightsButton setTitle:@"Clear highlights" forState:UIControlStateNormal];
    _clearHighlightsButton.frame = CGRectMake(3.0, 109.0, 150.0, 50.0);
    _clearHighlightsButton.backgroundColor = [UIColor lightGrayColor];

    [_mapView addSubview:_clearHighlightsButton];

    [self addObservers];

    WRLDMapCamera* camera = [_mapView camera];
    camera.centerCoordinate = CLLocationCoordinate2DMake(56.459966, -2.978167);
    camera.distance = 250;
    camera.indoorMapId = @"westport_house";
    camera.indoorMapFloorId = 2;

    [_mapView setCamera:camera];
}

- (void) dealloc
{
    if (_mapView)
    {
        [self removeObservers];
    }
}

- (void) addObservers
{
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(didEnterIndoorMap)
                   name:WRLDMapViewDidEnterIndoorMapNotification object:_mapView];
    [center addObserver:self selector:@selector(didExitIndoorMap)
                   name:WRLDMapViewDidExitIndoorMapNotification object:_mapView];
}

- (void) removeObservers
{
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self name:WRLDMapViewDidEnterIndoorMapNotification object:_mapView];
    [center removeObserver:self name:WRLDMapViewDidExitIndoorMapNotification object:_mapView];
}

- (BOOL) shouldAutorotate
{
    return false;
}

//- (void) goToFloor
//{
//    [_mapView enterIndoorMap:@"westport_house"];
//}

- (void) didEnterIndoorMap
{
//    [_mapView setFloorByIndex:2];
//    [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(56.459984, -2.978238) zoomLevel:20 animated:YES];
}

- (void) didExitIndoorMap
{

}

- (void) enableExitButton:(BOOL)enabled
{
//    [_goToFloorButton setEnabled:YES];
//    _goToFloorButton.alpha = enabled ? 1.0 : 0.7;
}

- (void) setEntityHighlights
{
    [_mapView setIndoorEntityHighlights:_mapView.activeIndoorMap.indoorId
                        indoorEntityIds:@[@"0007", @"Small Meeting Room"]
                                  color:[[UIColor redColor] colorWithAlphaComponent:0.5]];

    [_mapView setIndoorEntityHighlights:_mapView.activeIndoorMap.indoorId
                        indoorEntityIds:@[@"0002", @"Meeting Room"]
                                  color:[[UIColor blueColor] colorWithAlphaComponent:0.5]];

    [_mapView setIndoorEntityHighlights:_mapView.activeIndoorMap.indoorId
                        indoorEntityIds:@[@"0033"]
                                  color:[[UIColor greenColor] colorWithAlphaComponent:0.5]];
}

- (void) clearEntityHighlights
{
    [_mapView clearAllIndoorEntityHighlights];
}

- (void)mapView:(WRLDMapView *)mapView didPickIndoorEntities:(NSArray<NSString *> *)indoorEntityIds
{
    [_mapView setIndoorEntityHighlights:_mapView.activeIndoorMap.indoorId
                        indoorEntityIds:indoorEntityIds
                                  color:[[UIColor redColor] colorWithAlphaComponent:0.5]];
}


@end


