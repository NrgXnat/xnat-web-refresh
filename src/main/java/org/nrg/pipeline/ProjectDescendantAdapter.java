/*
 * web: org.nrg.pipeline.ProjectDescendantAdapter
 * XNAT http://www.xnat.org
 * Copyright (c) 2005-2017, Washington University School of Medicine and Howard Hughes Medical Institute
 * All Rights Reserved
 *
 * Released under the Simplified BSD.
 */

package org.nrg.pipeline;

import org.nrg.xdat.model.XnatProjectdataI;
import org.nrg.xdat.om.XnatExperimentdata;
import org.nrg.xdat.om.XnatSubjectdata;
import org.nrg.xft.ItemI;

public class ProjectDescendantAdapter {
    
    ItemI _om;
    
    public ProjectDescendantAdapter(ItemI om) {
        _om = om;
    }

    public XnatProjectdataI getFirstProject() {
        XnatProjectdataI rtn = null;
        if (_om == null) return rtn;
        //TODO Remove this Sys out
        System.out.println("OM IS AN INSTANCE OF " + _om.getClass().getName());
        try {
            XnatExperimentdata exp = (XnatExperimentdata) _om;
            rtn = exp.getFirstProject();
            exp = null;
        }catch(ClassCastException ce) {
            try {
                XnatSubjectdata sub = (XnatSubjectdata)_om;
                rtn = sub.getFirstProject();
                sub = null;
            }catch(ClassCastException ce1){
                
            }
        }
        return rtn;
    }
    
}
