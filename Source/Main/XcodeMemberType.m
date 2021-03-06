////////////////////////////////////////////////////////////////////////////////
//
//  JASPER BLUES
//  Copyright 2012 Jasper Blues
//  All Rights Reserved.
//
//  NOTICE: Jasper Blues permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////




#import "XcodeMemberType.h"
#import "Utils/XCEnumUtils.h"

@implementation NSDictionary (XcodeMemberType)

static NSDictionary * _projectNodeTypesAsStrings;

+ (NSDictionary*) dictionaryWithProjectNodeTypesAsStrings {
   // This is the most vital operation on adding 500+ files
   // So, we caching this dictionary
   if (!_projectNodeTypesAsStrings) {
      _projectNodeTypesAsStrings =  [[NSDictionary alloc] initWithObjectsAndKeys:boxEnum(PBXNilType), @"PBXNilType",
                                                                               boxEnum(PBXBuildFile), @"PBXBuildFile",
                                                                               boxEnum(PBXContainerItemProxy), @"PBXContainerItemProxy",
                                                                               boxEnum(PBXCopyFilesBuildPhase), @"PBXCopyFilesBuildPhase",
                                                                               boxEnum(PBXFileReference), @"PBXFileReference",
                                                                               boxEnum(PBXFrameworksBuildPhase), @"PBXFrameworksBuildPhase",
                                                                               boxEnum(PBXGroup), @"PBXGroup",
                                                                               boxEnum(PBXNativeTarget), @"PBXNativeTarget",
                                                                               boxEnum(PBXProject), @"PBXProject",
                                                                               boxEnum(PBXReferenceProxy), @"PBXReferenceProxy",
                                                                               boxEnum(PBXResourcesBuildPhase), @"PBXResourcesBuildPhase",
                                                                               boxEnum(PBXSourcesBuildPhase), @"PBXSourcesBuildPhase",
                                                                               boxEnum(PBXTargetDependency), @"PBXTargetDependency",
                                                                               boxEnum(PBXVariantGroup), @"PBXVariantGroup",
                                                                               boxEnum(XCBuildConfiguration), @"XCBuildConfiguration",
                                                                               boxEnum(XCConfigurationList), @"XCConfigurationList", nil];
   }
   return _projectNodeTypesAsStrings;
}

@end

@implementation NSString (ProjectNodeType)

+ (NSString*) stringFromMemberType:(XcodeMemberType)nodeType {
    NSDictionary* nodeTypesToString = [NSDictionary dictionaryWithProjectNodeTypesAsStrings];
    return [[nodeTypesToString allKeysForObject:boxEnum(nodeType)] objectAtIndex:0];
}


- (XcodeMemberType) asMemberType {
    NSDictionary* nodeTypesToString = [NSDictionary dictionaryWithProjectNodeTypesAsStrings];
    return (XcodeMemberType) [[nodeTypesToString objectForKey:self] intValue];
}


@end