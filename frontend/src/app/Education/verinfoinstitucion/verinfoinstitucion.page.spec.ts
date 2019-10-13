import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VerinfoinstitucionPage } from './verinfoinstitucion.page';

describe('VerinfoinstitucionPage', () => {
  let component: VerinfoinstitucionPage;
  let fixture: ComponentFixture<VerinfoinstitucionPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VerinfoinstitucionPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VerinfoinstitucionPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
