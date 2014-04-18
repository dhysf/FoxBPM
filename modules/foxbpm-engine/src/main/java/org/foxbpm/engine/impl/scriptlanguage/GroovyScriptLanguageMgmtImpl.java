/**
 * Copyright 1996-2014 FoxBPM ORG.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * @author kenshin
 * @author ych
 */
package org.foxbpm.engine.impl.scriptlanguage;

import groovy.lang.GroovyShell;

import org.foxbpm.engine.runtime.ExecutionContext;
import org.foxbpm.engine.scriptlanguage.AbstractScriptLanguageMgmt;

public class GroovyScriptLanguageMgmtImpl extends AbstractScriptLanguageMgmt {

	private GroovyShell groovyShell;

	@Override
	public AbstractScriptLanguageMgmt init() {
		groovyShell = new GroovyShell();
		return this;
	}

	@Override
	public void close() {
		groovyShell = null;
	}

	@Override
	public Object execute(String scriptText) {
		return groovyShell.evaluate(scriptText);
	}
	@Override
	public void setVariable(String variableName, Object variableObj) {
		groovyShell.setVariable(variableName, variableObj);
	}

	@Override
	public void setVariable(String variableName, Object variableObj,
			ExecutionContext executionContext) {
		dataVariableCalculate(variableName, executionContext);
		String scriptText = getExpressionAll(variableName);
		groovyShell.setVariable(scriptText, variableObj);
	}

	@Override
	public Object getVariable(String variableName) {
		return groovyShell.getVariable(variableName);
	}

	@Override
	public Object execute(String scriptText, ExecutionContext executionContext) {
		if (scriptText == null) {
			return null;
		}
		dataVariableCalculate(scriptText, executionContext);
		Object resultObj = false;
		// 绑定变量
		if (executionContext != null) {
			groovyShell.setVariable("processInfo", executionContext);
		}
		String scriptTextTemp = getExpressionAll(scriptText);
		resultObj = groovyShell.evaluate(scriptTextTemp);
		return resultObj;
	}

}