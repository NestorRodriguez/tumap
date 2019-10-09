import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MinasestadoactualPage } from './minasestadoactual.page';

describe('MinasestadoactualPage', () => {
  let component: MinasestadoactualPage;
  let fixture: ComponentFixture<MinasestadoactualPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MinasestadoactualPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MinasestadoactualPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
