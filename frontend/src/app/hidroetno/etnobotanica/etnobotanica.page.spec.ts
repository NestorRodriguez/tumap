import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EtnobotanicaPage } from './etnobotanica.page';

describe('EtnobotanicaPage', () => {
  let component: EtnobotanicaPage;
  let fixture: ComponentFixture<EtnobotanicaPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EtnobotanicaPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EtnobotanicaPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
